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
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://forge.barrettruth.com/barrettruth/live-server.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

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

-- gitsigns config 
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})

-- Persistent undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Persistent registers, marks and history
vim.opt.shada = "!,'1000,<1000,s100,h"

-- Save cursor position and folds
vim.opt.viewoptions = { "cursor", "folds" }

local group = vim.api.nvim_create_augroup("PersistentView", {
  clear = true,
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = group,
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! mkview")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! loadview")
    end
  end,
})

-- linter settings
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
})

-- mini-pick settings
require("mini.pick").setup({
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)

      return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
        border = "rounded",
      }
    end,
  },
})

-- bufferline
require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "thin",
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = true,
  },
})
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")

require("autocmds")
require("snippets")
