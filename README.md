# java-logic-trainer.nvim

A Neovim plugin for practicing pure Java logic with progressive exercises, editable solution files, and automatic checking through Maven + JUnit 5.

The checker does not use AI. Each exercise is validated with deterministic tests.

## Requirements

- Neovim
- Java 17+
- Maven
- LazyVim or lazy.nvim

## Installation with lazy.nvim / LazyVim

```lua
{
  "NachoOsella/java-logic-trainer.nvim",
  config = function()
    require("java-logic-trainer").setup({ keymaps = true })
  end,
}
```

For local development:

```lua
{
  dir = "~/Documents/java-nvim",
  name = "java-logic-trainer.nvim",
  config = function()
    require("java-logic-trainer").setup({ keymaps = true })
  end,
}
```

## Commands

```vim
:JavaLogicStart     " open the selector or the next pending exercise
:JavaLogicNext      " open the next pending exercise
:JavaLogicCheck     " run mvn test for the active exercise
:JavaLogicHint      " show a progressive hint
:JavaLogicProgress  " show local progress
:JavaLogicReset     " reset progress without deleting solutions
```

## Optional keymaps

Enable `keymaps = true` in `setup()` to register:

```lua
<leader>js -- start exercise
<leader>jc -- check exercise
<leader>jn -- next exercise
<leader>jh -- show hint
<leader>jp -- show progress
```

## Basic usage

1. Run `:JavaLogicStart`.
2. Choose `Next pending exercise` or any unlocked exercise.
3. Neovim opens a split screen with:
   - `STATEMENT.md` with the exercise statement.
   - `src/main/java/Exercise.java` as the editable solution file.
4. Implement the requested method in `Exercise.java`.
5. Run `:JavaLogicCheck`.
6. If the tests pass, the exercise is marked as completed.
7. Run `:JavaLogicNext` to continue.

## Local workspace

Exercises are copied to:

```txt
~/.local/share/nvim/java-logic-trainer/workspace/
```

Example:

```txt
workspace/
└── count-vowels/
    ├── pom.xml
    ├── STATEMENT.md
    └── src/
        ├── main/java/Exercise.java
        └── test/java/ExerciseTest.java
```

The plugin does not overwrite `Exercise.java` when it already exists, so your solutions are not deleted without confirmation. It may regenerate `pom.xml`, `STATEMENT.md`, and tests. Test files are kept for the checker, but they are not opened in the exercise layout.

## Progress

Progress is saved in:

```txt
~/.local/share/nvim/java-logic-trainer/progress.json
```

Format:

```json
{
  "completed": ["is-even", "count-vowels"],
  "currentDifficulty": 2,
  "lastExercise": "count-vowels",
  "hints": {}
}
```

To reset progress:

```vim
:JavaLogicReset
```

This does not delete your solution files in the workspace.

## Exercises included in the MVP

The MVP includes 80 English exercises, with at least 20 exercises in each difficulty tier:

- Difficulty 1: beginner foundations, conditionals, numbers, strings, and small arithmetic methods.
- Difficulty 2: beginner practice with divisibility, loops, strings, and validation logic.
- Difficulty 3: intermediate array traversal, counting, searching, and aggregation.
- Difficulty 4: intermediate array transformations, copying, merging, rotation, frequency maps, and non-mutating operations.

## Internal structure

```txt
java-logic-trainer.nvim/
├── plugin/
│   └── java-logic-trainer.lua
├── lua/
│   └── java-logic-trainer/
│       ├── init.lua
│       ├── commands.lua
│       ├── exercises.lua
│       ├── runner.lua
│       ├── progress.lua
│       ├── workspace.lua
│       └── ui.lua
├── exercises/
│   ├── beginner/
│   ├── intermediate/
│   └── advanced/
├── templates/
│   └── maven/
│       ├── pom.xml
│       └── src/
│           ├── main/java/Exercise.java
│           └── test/java/ExerciseTest.java
├── LICENSE
└── README.md
```

## Adding new exercises

Edit `lua/java-logic-trainer/exercises.lua` and add an entry with this format:

```lua
{
  id = "count-vowels",
  title = "Count vowels",
  level = "beginner",
  difficulty = 1,
  topic = "strings",
  description = [[...]],
  starter_code = [[public class Exercise { ... }]],
  visible_tests = [[assertEquals(2, Exercise.countVowels("hello"));]],
  hidden_tests = [[
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest { ... }
]],
  hints = {
    "First hint.",
    "Second hint.",
    "Third hint."
  }
}
```

Recommended criteria:

- Pure methods.
- No console input, no `Scanner`, no files.
- Simple Java 17.
- Tests with normal, edge, and unusual cases.
- Statements with exact signature, rules, and examples.

## Automatic checking

`:JavaLogicCheck` asynchronously runs:

```bash
mvn test
```

inside the active exercise directory. If Maven or Java is not installed, the plugin shows a clear error inside Neovim.
