--[[
  Configuração dos LSPs
  A chave deve ser um lsp válido (checar com Mason)
  O valor atribuido são as configurações do lsp
]]

local lspconfig = require('lspconfig')

return {
    lua_ls = {},
    ts_ls = {},
}
