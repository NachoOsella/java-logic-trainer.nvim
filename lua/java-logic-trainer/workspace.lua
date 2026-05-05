local M = {}

M.root = vim.fn.stdpath("data") .. "/java-logic-trainer/workspace"

local function write(path, content, overwrite)
  if not overwrite and vim.fn.filereadable(path) == 1 then
    return false
  end
  vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
  vim.fn.writefile(vim.split(content, "\n", { plain = true }), path)
  return true
end

function M.exercise_dir(exercise)
  return M.root .. "/" .. exercise.id
end

function M.paths(exercise)
  local dir = M.exercise_dir(exercise)
  return {
    root = dir,
    pom = dir .. "/pom.xml",
    statement = dir .. "/STATEMENT.md",
    solution = dir .. "/src/main/java/Exercise.java",
    test = dir .. "/src/test/java/ExerciseTest.java",
  }
end

function M.maven_pom()
  local template = debug.getinfo(1, "S").source:sub(2)
  local plugin_root = vim.fn.fnamemodify(template, ":h:h:h")
  local template_pom = plugin_root .. "/templates/maven/pom.xml"
  if vim.fn.filereadable(template_pom) == 1 then
    return table.concat(vim.fn.readfile(template_pom), "\n")
  end
  return [[<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>dev.trainer</groupId>
  <artifactId>java-logic-exercise</artifactId>
  <version>1.0.0</version>
  <properties>
    <maven.compiler.source>17</maven.compiler.source>
    <maven.compiler.target>17</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <junit.jupiter.version>5.10.2</junit.jupiter.version>
  </properties>
  <dependencies>
    <dependency>
      <groupId>org.junit.jupiter</groupId>
      <artifactId>junit-jupiter</artifactId>
      <version>${junit.jupiter.version}</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>3.2.5</version>
      </plugin>
    </plugins>
  </build>
</project>]]
end

function M.statement(exercise)
  -- Build a focused statement without exposing tests in the learning view.
  local lines = {
    "# Exercise: " .. exercise.title,
    "",
    "Level: " .. exercise.level,
    "Difficulty: " .. tostring(exercise.difficulty),
    "Topic: " .. exercise.topic,
    "",
    exercise.description,
    "",
    "Useful commands:",
    "- :JavaLogicCheck to run the checker",
    "- :JavaLogicHint to show a hint",
    "- :JavaLogicNext to continue",
  }
  return table.concat(lines, "\n")
end

function M.create(exercise, opts)
  opts = opts or {}
  vim.fn.mkdir(M.root, "p")
  local p = M.paths(exercise)
  vim.fn.mkdir(p.root .. "/src/main/java", "p")
  vim.fn.mkdir(p.root .. "/src/test/java", "p")

  write(p.pom, M.maven_pom(), true)
  write(p.statement, M.statement(exercise), true)
  local wrote_solution = write(p.solution, exercise.starter_code, opts.overwrite_solution == true)
  write(p.test, exercise.hidden_tests or exercise.visible_tests, true)
  return p, wrote_solution
end

local function stop_workspace_lsp_clients(dir)
  -- Stop LSP clients whose root directory is the exercise workspace.
  -- This is important for jdtls because each exercise is a different Maven root.
  if not vim.lsp then
    return
  end

  local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
  if not get_clients then
    return
  end

  for _, client in ipairs(get_clients()) do
    local root_dir = client.config and client.config.root_dir
    local client_root = root_dir and vim.fn.fnamemodify(root_dir, ":p") or ""
    if client_root ~= "" and client_root:sub(1, #dir) == dir then
      client.stop(true)
    end
  end
end

function M.close(exercise)
  local dir = vim.fn.fnamemodify(M.exercise_dir(exercise), ":p")

  stop_workspace_lsp_clients(dir)

  -- Save and unload every buffer that belongs to the exercise workspace.
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    local path = name ~= "" and vim.fn.fnamemodify(name, ":p") or ""
    if path:sub(1, #dir) == dir then
      if vim.api.nvim_buf_get_option(buf, "modified") then
        vim.api.nvim_buf_call(buf, function()
          vim.cmd("silent write")
        end)
      end
      vim.cmd("silent bdelete " .. tostring(buf))
    end
  end
end

function M.open(exercise)
  local p = M.create(exercise)

  -- Open only the statement and the editable Java class in a vertical split.
  vim.cmd("tabnew " .. vim.fn.fnameescape(p.statement))
  vim.bo.filetype = "markdown"
  vim.bo.modifiable = false
  vim.bo.readonly = true
  vim.cmd("vsplit " .. vim.fn.fnameescape(p.solution))
  vim.cmd("wincmd l")
  return p
end

return M
