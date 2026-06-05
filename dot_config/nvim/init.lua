vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "


vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },

})

require "mini.pick".setup()
require "mini.pairs".setup()



vim.cmd("colorscheme catppuccin")

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
vim.keymap.set('n', '<leader>fg', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>b', ":Pick buffers <CR>")


require("blink.cmp").setup({
  keymap = {
    preset = "super-tab",
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    documentation = {
      auto_show = true,
    },
  },

  sources = {
    default = { "lsp", "path", "buffer", "snippets"},
  },
})

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})


vim.lsp.config("pyright", {
	capabilities = capabilities,
})

vim.lsp.config("tinymist", {
	capabilities = capabilities,
})

vim.lsp.enable({ "lua_ls", "pyright", "tinymist" })

require("autocmds")
require("snippets")
