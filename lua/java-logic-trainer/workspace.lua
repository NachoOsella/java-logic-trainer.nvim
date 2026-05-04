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
  local lines = {
    "# Exercise: " .. exercise.title,
    "",
    "Level: " .. exercise.level,
    "Difficulty: " .. tostring(exercise.difficulty),
    "Topic: " .. exercise.topic,
    "",
    exercise.description,
    "",
    "## Visible tests",
    "",
    "```java",
    exercise.visible_tests or "",
    "```",
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

function M.open(exercise)
  local p = M.create(exercise)
  vim.cmd("tabnew " .. vim.fn.fnameescape(p.statement))
  vim.bo.filetype = "markdown"
  vim.cmd("vsplit " .. vim.fn.fnameescape(p.solution))
  vim.cmd("wincmd l")
  vim.cmd("botright split " .. vim.fn.fnameescape(p.test))
  vim.bo.modifiable = false
  vim.bo.readonly = true
  vim.cmd("wincmd k")
  return p
end

return M
