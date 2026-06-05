vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "typst", "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})


vim.api.nvim_create_user_command("RemoveStyles", function()
  vim.cmd [[%s/\s*style=['"][^'"]*['"]//g]]
end, {})
