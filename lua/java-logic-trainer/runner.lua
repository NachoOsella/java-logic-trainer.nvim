local M = {}

local ui = require("java-logic-trainer.ui")
local progress = require("java-logic-trainer.progress")
local workspace = require("java-logic-trainer.workspace")

local running = false

local function executable(name)
  return vim.fn.executable(name) == 1
end

local function output_buffer(title, lines)
  local buf, win = ui.float(title, lines, { width = math.min(100, math.floor(vim.o.columns * 0.9)) })
  vim.api.nvim_buf_set_option(buf, "filetype", "text")
  return buf, win
end

local function friendly_failure(lines, exercise)
  local text = table.concat(lines, "\n")
  local out = { "The exercise check failed: " .. exercise.title, "" }

  local failures = text:match("Failures:%s*(%d+)") or text:match("Failures:%s*(%d+),")
  local errors = text:match("Errors:%s*(%d+)") or text:match("Errors:%s*(%d+),")
  if failures or errors then
    table.insert(out, "Failed tests: " .. tostring(failures or 0))
    table.insert(out, "Errors: " .. tostring(errors or 0))
    table.insert(out, "")
  end

  for _, line in ipairs(lines) do
    if line:match("Tests run:") or line:match("<<< FAILURE") or line:match("<<< ERROR") or line:match("expected:") or line:match("org.opentest4j") or line:match("COMPILATION ERROR") or line:match("cannot find symbol") then
      table.insert(out, line)
    end
  end

  if #out <= 4 then
    vim.list_extend(out, lines)
  end

  if exercise.hints and exercise.hints[1] then
    table.insert(out, "")
    table.insert(out, "Hint: " .. exercise.hints[1])
  end
  return out
end

function M.check(exercise)
  if running then
    ui.notify("A check is already running", vim.log.levels.WARN)
    return
  end
  if not exercise then
    ui.notify("There is no active exercise. Run :JavaLogicStart", vim.log.levels.ERROR)
    return
  end
  if not executable("java") then
    ui.notify("Java is not installed or is not in PATH. Java 17+ is required.", vim.log.levels.ERROR)
    return
  end
  if not executable("mvn") then
    ui.notify("Maven is not installed or is not in PATH.", vim.log.levels.ERROR)
    return
  end

  vim.cmd("silent! wall")
  local paths = workspace.create(exercise)
  local cwd = paths.root
  local lines = { "Running mvn test in:", cwd, "" }
  local buf = output_buffer("Java Logic Check", lines)
  running = true

  local function append(new_lines)
    if type(new_lines) == "string" then new_lines = vim.split(new_lines, "\n", { plain = true, trimempty = true }) end
    if not new_lines or #new_lines == 0 then return end
    vim.api.nvim_buf_set_option(buf, "modifiable", true)
    vim.api.nvim_buf_set_lines(buf, -1, -1, false, new_lines)
    vim.api.nvim_buf_set_option(buf, "modifiable", false)
  end

  local cmd = { "mvn", "test" }
  if vim.system then
    vim.system(cmd, { cwd = cwd, text = true }, function(result)
      vim.schedule(function()
        running = false
        local all = {}
        vim.list_extend(all, vim.split(result.stdout or "", "\n", { plain = true, trimempty = true }))
        vim.list_extend(all, vim.split(result.stderr or "", "\n", { plain = true, trimempty = true }))
        vim.api.nvim_buf_set_option(buf, "modifiable", true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        if result.code == 0 then
          progress.complete(exercise)
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Correct. Exercise completed.", "", "Use :JavaLogicNext to continue." })
          ui.notify("Correct. Exercise completed.")
        else
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, friendly_failure(all, exercise))
          ui.notify("The check failed. Review the results buffer.", vim.log.levels.WARN)
        end
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
      end)
    end)
  else
    vim.fn.jobstart(cmd, {
      cwd = cwd,
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data) if data then append(data) end end,
      on_stderr = function(_, data) if data then append(data) end end,
      on_exit = function(_, code)
        vim.schedule(function()
          running = false
          local current = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
          vim.api.nvim_buf_set_option(buf, "modifiable", true)
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
          if code == 0 then
            progress.complete(exercise)
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Correct. Exercise completed.", "", "Use :JavaLogicNext to continue." })
            ui.notify("Correct. Exercise completed.")
          else
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, friendly_failure(current, exercise))
            ui.notify("The check failed. Review the results buffer.", vim.log.levels.WARN)
          end
          vim.api.nvim_buf_set_option(buf, "modifiable", false)
        end)
      end,
    })
  end
end

return M
