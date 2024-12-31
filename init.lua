-- [[ Configurações iniciais ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.base46_cache = vim.fn.stdpath('data') .. '/base46_cache/'

-- [[ Package Manager ]]
-- Automaticamente carrega os plugins em lua/plugins/
require('config.lazy')

-- [[ Configurações ]]
require('options')
require('mappings')

-- caches do base46
dofile(vim.g.base46_cache .. 'defaults')
dofile(vim.g.base46_cache .. 'statusline')
dofile(vim.g.base46_cache .. 'syntax')
dofile(vim.g.base46_cache .. 'treesitter')
dofile(vim.g.base46_cache .. 'lsp')
