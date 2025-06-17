
require("mason").setup()
require("mason-lspconfig").setup()

-- vim.cmd[[autocmd FileType mason highlight MasonNormal guibg=12]]
vim.cmd[[autocmd! ColorScheme * highlight FloatBorder guibg=#000000]]

local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', '<leader>yr', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<leader>i', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts) 
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) 
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

-- local on_attach = function(client, bufnr)
--     -- disable formatter
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--
--     vim.g.coq_settings = {
--         auto_start = true,
--         clients = {
--             buffers = {
--                 enabled = false,
--             },
--             lsp = {
--                 always_on_top = {},
--             },
--             snippets = {
--                 enabled = false,
--                 warn = {}
--             },
--         }
--     }
--
--     vim.cmd[[COQnow -s]]
-- end
--
-- local lspconfig = require("lspconfig")
--
-- require('typescript-tools').setup{
--     on_attach = on_attach,
--     settings = {
--         tsserver_file_preferences = {
--             includeInlayParameterNameHints = 'all',
--             includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--             includeInlayFunctionParameterTypeHints = true,
--             includeInlayFunctionParameterTypeHintsWhenTypeMatchesName = true,
--             includeInlayVariableTypeHints = true,
--             includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--             includeInlayPropertyDeclarationTypeHints = true,
--             includeInlayFunctionLikeReturnTypeHints = true,
--             includeInlayEnumMemberValueHints = true,
--         }
--     }
-- }
--
-- -- lspconfig.tsserver.setup{
-- --   on_attach = on_attach
-- -- }
--
-- -- lspconfig.spectral.setup{}
-- lspconfig.prismals.setup{}
-- lspconfig.gopls.setup{
--     on_attach = on_attach
-- }
-- lspconfig.eslint.setup{}

local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup{}


vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.rs", "*.go" },
    callback = function()
        vim.lsp.buf.format()
    end,
})
