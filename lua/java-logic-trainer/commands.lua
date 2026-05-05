local M = {}

local exercises = require("java-logic-trainer.exercises")
local progress = require("java-logic-trainer.progress")
local workspace = require("java-logic-trainer.workspace")
local runner = require("java-logic-trainer.runner")
local ui = require("java-logic-trainer.ui")

local current_exercise = nil

local function close_current_exercise()
  -- Close the previous exercise before opening another one so LSP clients,
  -- buffers, and windows from old Maven roots do not accumulate.
  if current_exercise then
    workspace.close(current_exercise)
  end
end

local function open_exercise(exercise)
  if not exercise then
    ui.notify("There are no pending exercises.")
    return
  end
  close_current_exercise()
  current_exercise = exercise
  progress.set_last(exercise)
  workspace.open(exercise)
  ui.notify("Exercise opened: " .. exercise.title)
end

function M.start()
  local p = progress.load()
  local available = exercises.available(p)
  local choices = {}
  for _, exercise in ipairs(available) do
    local status = progress.is_completed(exercise.id, p) and "completed" or "pending"
    table.insert(choices, string.format("[%s] D%d %s - %s", status, exercise.difficulty, exercise.id, exercise.title))
  end
  table.insert(choices, 1, "Next pending exercise")

  vim.ui.select(choices, { prompt = "Java Logic Trainer" }, function(choice, idx)
    if not choice then return end
    if idx == 1 then
      open_exercise(exercises.next_pending(p))
      return
    end
    open_exercise(available[idx - 1])
  end)
end

function M.next()
  local p = progress.load()
  -- If Neovim reloaded the plugin state, close the last persisted exercise too.
  if not current_exercise and p.lastExercise then
    local previous_exercise = exercises.by_id(p.lastExercise)
    if previous_exercise then
      workspace.close(previous_exercise)
    end
  end
  open_exercise(exercises.next_pending(p))
end

function M.check()
  if not current_exercise then
    local p = progress.load()
    current_exercise = p.lastExercise and exercises.by_id(p.lastExercise) or exercises.next_pending(p)
  end
  runner.check(current_exercise)
end

function M.hint()
  if not current_exercise then
    local p = progress.load()
    current_exercise = p.lastExercise and exercises.by_id(p.lastExercise) or exercises.next_pending(p)
  end
  if not current_exercise then
    ui.notify("There is no active exercise.", vim.log.levels.ERROR)
    return
  end
  local hints = current_exercise.hints or {}
  if #hints == 0 then
    ui.notify("This exercise has no hints.")
    return
  end
  local idx = progress.next_hint(current_exercise)
  ui.markdown("Hint", string.format("# %s\n\nHint %d/%d:\n\n%s", current_exercise.title, idx, #hints, hints[idx]))
end

function M.show_progress()
  local p = progress.load()
  local completed = {}
  for _, exercise in ipairs(exercises.all()) do
    if progress.is_completed(exercise.id, p) then
      table.insert(completed, "- " .. exercise.title .. " (`" .. exercise.id .. "`)")
    end
  end
  local lines = {
    "# Java Logic Trainer Progress",
    "",
    "Completed: " .. tostring(#completed) .. "/" .. tostring(#exercises.all()),
    "Unlocked difficulty: " .. tostring(p.currentDifficulty or 1),
    "Last exercise: " .. tostring(p.lastExercise or "none"),
    "File: " .. progress.path,
    "",
    "## Completed exercises",
    "",
  }
  if #completed == 0 then
    table.insert(lines, "You have not completed any exercises yet.")
  else
    vim.list_extend(lines, completed)
  end
  ui.markdown("Java Logic Progress", table.concat(lines, "\n"))
end

function M.reset()
  vim.ui.select({ "No", "Yes, reset progress" }, { prompt = "Reset progress? Your solutions will not be deleted." }, function(choice)
    if choice == "Yes, reset progress" then
      current_exercise = nil
      progress.reset()
      ui.notify("Progress reset.")
    end
  end)
end

function M.setup()
  vim.api.nvim_create_user_command("JavaLogicStart", M.start, {})
  vim.api.nvim_create_user_command("JavaLogicNext", M.next, {})
  vim.api.nvim_create_user_command("JavaLogicCheck", M.check, {})
  vim.api.nvim_create_user_command("JavaLogicHint", M.hint, {})
  vim.api.nvim_create_user_command("JavaLogicProgress", M.show_progress, {})
  vim.api.nvim_create_user_command("JavaLogicReset", M.reset, {})
end

return M
