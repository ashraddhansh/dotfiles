-- load defaults i.e lua_lsp
local lspconfig = require 'lspconfig'
local nvlsp = require 'nvchad.configs.lspconfig'
local capabilities = require('blink.cmp').get_lsp_capabilities(nvlsp.capabilities)

lspconfig.lua_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim', 'hl' }, -- Add 'hl' as a global
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          '/usr/share/hypr/stubs',
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

require('nvchad.configs.lspconfig').defaults()
-- EXAMPLE
local servers = { 'html', 'cssls', 'clangd', 'marksman', 'pyright', 'tinymist' }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  }
end

-- HTML specific config (this was inside the loop, moved it out)
lspconfig.html.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  filetypes = { 'html', 'templ' },
  init_options = {
    provideFormatter = true,
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
}

-- Lua Language Server with Hyprland stubs
lspconfig.lua_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          '/usr/share/hypr/stubs',
        },
      },
    },
  },
}
