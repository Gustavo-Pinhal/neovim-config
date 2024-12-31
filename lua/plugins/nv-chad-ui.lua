--[[ Diversas funcionalidades para interface gráfica ]]

return {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
        'nvchad/ui',
        config = function()
            require('nvchad')

            -- tabufline
            vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'buffer new' })

            vim.keymap.set('n', '<tab>', function()
                require('nvchad.tabufline').next()
            end, { desc = 'buffer goto next' })

            vim.keymap.set('n', '<S-tab>', function()
                require('nvchad.tabufline').prev()
            end, { desc = 'buffer goto prev' })

            vim.keymap.set('n', '<leader>x', function()
                require('nvchad.tabufline').close_buffer()
            end, { desc = 'buffer close' })

            -- Alternar fundo
            vim.keymap.set('n', '<leader>tt', function()
                require('base46').toggle_transparency()
            end, { desc = 'Alternar fundo' })
        end,
    },
    {
        'nvchad/base46',
        lazy = true,
        build = function()
            require('base46').load_all_highlights()
        end,
    },
}
