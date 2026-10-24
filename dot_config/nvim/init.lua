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
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://forge.barrettruth.com/barrettruth/live-server.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },

})

require "mini.pick".setup()
require "mini.pairs".setup()



vim.cmd("colorscheme catppuccin")

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ff', ":Pick files<CR>")
vim.keymap.set('n', '<leader>fg', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>b', ":Pick buffers <CR>")

require 'typst-preview'.setup {
  open_cmd = 'firefox %s',
}
vim.g.live_server = {
  port = 8080,
  browser = false,
}

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



vim.lsp.enable({ "lua_ls", "pyright", "tinymist", "gopls", "html", "cssls","ts_ls", "emmet_language_server" })



require("autocmds")
require("snippets")
