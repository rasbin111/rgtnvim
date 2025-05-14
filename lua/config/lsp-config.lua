-- lsp-config.lua for lsp-zero v2.x (early version)

-- Import lsp-zero
local lsp_zero = require('lsp-zero')

-- Basic setup with recommended defaults
lsp_zero.preset('recommended')

-- Define on_attach function for LSP-specific keybindings
lsp_zero.on_attach(function(client, bufnr)
  -- Default keybindings provided by lsp-zero
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Setup Mason if you're using it
require('mason').setup({})
require('mason-lspconfig').setup({
  -- Add the servers you want to install
  ensure_installed = {
    -- 'tsserver',
    -- 'rust_analyzer',
    -- Add more as needed
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Configure lua_ls manually for Neovim configuration files
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = {
        enable = false,
      },
    }
  }
})

-- If you need to set up additional LSP servers directly:
-- require('lspconfig').tsserver.setup({})
-- require('lspconfig').rust_analyzer.setup({})
