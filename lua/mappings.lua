--[[
  NOTA: Mapeamento 

  O mapeamento relativo a um plugin deve ser feito
  no arquivo daquele plugin
]]

local map = vim.keymap.set

-- alternar buffers
map('n', '<leader><tab>', ':b#<CR>')

-- Navegação em modo de inserção
map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

-- Alternar janela
map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

-- Alternar comentário
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })

-- Demais
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })
map('n', '<space>a', ':!', { desc = 'Executar bash' })
map('n', '<space>ha', ':!git ', { desc = '' })
