--[[
    NOTA: Comentários coloridos

    Gera comentários coloridos de acordo com os critérios
    Para criar uma keyword customizada, siga a referência:
        FIX = {
            icon = ' ', -- icon used for the sign, and in search results
            color = 'error', -- can be a hex color, or a named color (see below)
            alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
--]]

return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    opts = {
        signs = false,

        keywords = {
            FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' } },
            TODO = { icon = ' ', color = 'info' },
            HACK = { icon = ' ', color = 'warning' },
            WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
            PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
            NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
            TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },

            NOTA = { icon = ' ', color = 'warning' },
        },
        colors = {
            error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
            warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
            info = { 'DiagnosticInfo', '#2563EB' },
            hint = { 'DiagnosticHint', '#10B981' },
            default = { 'Identifier', '#7C3AED' },
            test = { 'Identifier', '#FF00FF' },
        },
    },
}
