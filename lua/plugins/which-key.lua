-- [[ Exibe menu de ajuda para os atalhos ]]

return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        mappings = vim.g.have_nerd_font,
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
    config = function()
        vim.keymap.set('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })
        vim.keymap.set('n', '<leader>wk', function()
            vim.cmd('WhichKey ' .. vim.fn.input('WhichKey: '))
        end, { desc = 'whichkey query lookup' })
    end,
}
