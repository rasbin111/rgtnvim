-- Load lsp-zero
local lsp_zero = require('lsp-zero')

-- Configure lsp-zero
lsp_zero.on_attach(function(client, bufnr)
    -- Format on Save
    if client.supports_method('textDocument/formatting') then
        local group = 'lsp_autoformat'
        vim.api.nvim_create_augroup(group, { clear = false })
        vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            group = group,
            callback = function()
                vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            end,
        })
    end

    -- LSP Keybindings
    local opts = { buffer = bufnr, remap = false }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "gl", function()
        vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)


-- Mason setup
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'rust_analyzer' },
    handlers = {
        function(server_name)
            require('lsp-zero').default_setup(server_name) -- ✅ THIS USES YOUR on_attach!
        end,
    }
})


-- CMP Setup (optional, but usually goes here too)
local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
                cmp.select_next_item({ behavior = 'select' })
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})
