--[[
    NOTA: Fuzzy finder com diversas funcionalidades
--]]

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { '^node_modules/', '^vendor/' },
                },
            })
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope search keymaps' })
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Telescope search current word' })
            vim.keymap.set('n', '<leader>f/', builtin.live_grep, { desc = 'Telescope live grep in all files' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope search diagnostics' })

            vim.keymap.set('n', '<leader>fc', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = 'Telescope fuzzy search in current buffer' })

            vim.keymap.set('n', '<leader>fg', function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                })
            end, { desc = 'Telescope live grep in Open Files' })

            vim.keymap.set('n', '<leader>fiv', function()
                builtin.find_files({
                    cwd = vim.fn.stdpath('config'),
                })
            end, { desc = 'Open nvim config file' })
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',

        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown({}),
                    },
                },
            })
            require('telescope').load_extension('ui-select')
        end,
    },
    {
        'andrew-george/telescope-themes',
        config = function()
            require('telescope').load_extension('themes')

            vim.keymap.set('n', '<leader>th', ':Telescope themes<CR>', { noremap = true, silent = true, desc = 'Theme Switcher' })
        end,
    },
}
