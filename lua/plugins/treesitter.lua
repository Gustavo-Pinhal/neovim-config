--[[
    NOTA: Ferramenta de highlight do código

    Os Parsers são especificados em config/tree-sitter-ensure
--]]

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({

            -- Parsers que serão instalados automaticamente
            ensure_installed = require('config.tree-sitter-ensure'),

            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
