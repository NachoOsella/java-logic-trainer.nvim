local M = {}

function M.notify(message, level)
  vim.notify(message, level or vim.log.levels.INFO, { title = "Java Logic Trainer" })
end

function M.float(title, lines, opts)
  opts = opts or {}
  if type(lines) == "string" then
    lines = vim.split(lines, "\n", { plain = true })
  end
  local width = opts.width or math.min(90, math.floor(vim.o.columns * 0.85))
  local height = opts.height or math.min(#lines + 2, math.floor(vim.o.lines * 0.75))
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_name(buf, title)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " " .. title .. " ",
    title_pos = "center",
  })
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
  end, { buffer = buf, silent = true })
  vim.keymap.set("n", "<esc>", function()
    if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
  end, { buffer = buf, silent = true })
  return buf, win
end

function M.markdown(title, text)
  local buf, win = M.float(title, text)
  vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
  return buf, win
end

return M
