--[[
    NOTA: Configuração do LSP
--]]

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
        { 'hrsh7th/cmp-nvim-lsp' },
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            -- O código nessa seção é executado somente quando o Lsp é ativado
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = 'Goto definition' })
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = 'Goto declaration' })
                vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = 'Goto references' })
                vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, { desc = 'Goto implementation' })
                vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, { desc = 'Type definition' })
                vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Document symbols' })
                vim.keymap.set('n', '<leader>gs', builtin.lsp_dynamic_workspace_symbols, { desc = 'Workspace symbols' })
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
                vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, { desc = 'Show documentation' })
            end,
        })

        -- [[ Instalar, carregar e configurar servidores automaticamente ]]
        -- os servidores são definidos em config/lsp-servers.lua
        -- servidores e outros itens são baixados automaticamente com Mason
        -- formatadores definidos em config/formatters.lua são baixados pelo Mason
        -- capabilities refere-se à integração do Autocomplete (cmp) com o LSP

        local servers = require('config.lsp-servers')

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, require('config.formatters').ensure_installed)
        require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        })
    end,
}
