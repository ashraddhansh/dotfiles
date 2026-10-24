local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  -- Close terminal if visible
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_close(terminal_win, true)
    terminal_win = nil
    return
  end

  -- Reopen existing terminal buffer
  vim.cmd("botright 12split")

  terminal_win = vim.api.nvim_get_current_win()

  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
  else
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
  end

  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>v", toggle_terminal, {
  desc = "Toggle bottom terminal",
})

vim.keymap.set("t", "<leader>v", function()
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true),
    "n",
    false
  )
  vim.schedule(toggle_terminal)
end, {
  desc = "Toggle bottom terminal",
})
