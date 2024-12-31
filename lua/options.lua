--[[ 
  NOTA: Opções do neovim

  referências:
    `:help vim.opt`
    `:help option-list`
--]]

local opt = vim.opt

-- [[ Interface ]]
opt.mouse = 'a' -- permitir mouse
opt.mousehide = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.showmode = false
opt.showmatch = true -- parêntes equivalente
opt.splitright = true -- inserção de nova janela
opt.splitbelow = true -- inserção de nova janela
opt.list = true -- Sets how neovim will display certain whitespace characters in the editor. `:help 'list'` and `:help 'listchars'`
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.ignorecase = true -- busca do vim
opt.smartcase = true -- busca do vim
opt.scrolloff = 10 -- number of screen lines to keep above and below the cursor.

-- [[ Tabs, indent ]]
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-- [[ Memory, CPU ]]
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event
opt.timeoutlen = 300 -- Decrease mapped sequence wait time

-- [[ Demais configurações ]]

-- Enable break indent
opt.breakindent = true
-- Save undo history
opt.undofile = true
-- Keep signcolumn on by default
opt.signcolumn = 'yes'
-- Preview substitutions live, as you type!
opt.inccommand = 'split'
-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.schedule(function()
    opt.clipboard = 'unnamedplus'
end)
