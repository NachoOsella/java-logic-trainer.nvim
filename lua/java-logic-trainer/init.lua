local M = {}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", {
    keymaps = false,
  }, opts or {})

  require("java-logic-trainer.commands").setup(M.config)

  if M.config.keymaps then
    local map = vim.keymap.set
    map("n", "<leader>js", "<cmd>JavaLogicStart<cr>", { desc = "Java Logic: start" })
    map("n", "<leader>jc", "<cmd>JavaLogicCheck<cr>", { desc = "Java Logic: check" })
    map("n", "<leader>jn", "<cmd>JavaLogicNext<cr>", { desc = "Java Logic: next" })
    map("n", "<leader>jh", "<cmd>JavaLogicHint<cr>", { desc = "Java Logic: hint" })
    map("n", "<leader>jp", "<cmd>JavaLogicProgress<cr>", { desc = "Java Logic: progress" })
  end
end

return M
