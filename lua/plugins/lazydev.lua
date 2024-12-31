-- [[ Prove autocompletes para o código do nvim ]]

return {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
        library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
    },
}
