local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = {
                menu = 50,
                abbr = 50,
            },
            ellipsis_char = '...',
            show_labelDetails = true,
            symbol_map = {
                Copilot = '',
                Cmp = 'cmp',
            }
        })
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }), 
  }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'copilot' },
    }, {
        { name = 'buffer' },
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

-- require('typescript-tools').setup{
--     capabilities,
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
--
lspconfig.ts_ls.setup {
    capabilities = capabilities
}

lspconfig.gopls.setup {
    capabilities = capabilities
}
