--[[
    NOTA: Auto formatador 

    automaticamente chama um formatador de código

    Referências:
        Conform can also run multiple formatters sequentially
        python = { "isort", "black" },
        You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { "prettierd", "prettier", stop_after_first = true }
]]

return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>F',
            function()
                require('conform').format({ async = true, lsp_format = 'fallback' })
            end,
            mode = '',
            desc = 'Format buffer',
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            local lsp_format_opt
            if disable_filetypes[vim.bo[bufnr].filetype] then
                lsp_format_opt = 'never'
            else
                lsp_format_opt = 'fallback'
            end
            return {
                timeout_ms = 500,
                lsp_format = lsp_format_opt,
            }
        end,

        -- [[ Definição dos formatadores ]]
        formatters_by_ft = {
            lua = { 'stylua' },
            javascript = { 'prettier' },
            php = { 'pretty-php' },
        },
    },
}
