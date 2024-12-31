--[[
    NOTA: Engine de autocomplete

    Plugins relacionados ao autocomlete
    Engine responsável por fornecer autocompletes na digitação
    Integração com LSP (obtem autocomplete inteligente)
    Integração com repositórios de snippets
--]]

return {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            -- carregamento do friendly-snippets
            require('luasnip.loaders.from_vscode').lazy_load()

            local cmp = require('cmp')
            cmp.setup({
                snippet = {

                    -- snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                -- Estilo da janela
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                -- Mapeamento do teclado
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ['<tab>'] = cmp.mapping.confirm({ select = true }),
                }),

                -- Fontes de autocompletes
                sources = cmp.config.sources({
                    { name = 'lazydev' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }, {
                    { name = 'buffer' },
                }),
            })

            -- Autocomplete na pesquisa do vim
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                },
            })

            -- Autocomplete nos comandos do vim
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    { name = 'cmdline' },
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
            })
        end,
    },
}
