if vim.g.loaded_java_logic_trainer == 1 then
  return
end
vim.g.loaded_java_logic_trainer = 1

require("java-logic-trainer").setup()
