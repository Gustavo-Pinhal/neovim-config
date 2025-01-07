return {
    -- Instalados pelo Mason
    ensure_installed = {
        'stylua',
        'prettier',
        'pretty-php',
        -- 'djlint',
    },

    -- Configuração do Conform
    formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        php = { 'pretty-php' },
        -- twig = { 'djlint' },
    },
}
