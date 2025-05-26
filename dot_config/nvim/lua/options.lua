require "nvchad.options"


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "typst", "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" } -- set your preferred language
  end,
})

-- vim.opt.spelllang = 'en_us'
-- vim.opt.spell = true


-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
