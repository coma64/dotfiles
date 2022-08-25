local opt = vim.opt
local g = vim.g

vim.lsp.set_log_level(0)

g.mapleader = ' '
-- opt.timeoutlen = 400

opt.number = true
opt.relativenumber = true
-- highlight the line of the cursor
opt.cursorline = true
opt.wrap = false
opt.signcolumn = 'yes'

opt.shiftwidth = 4
opt.expandtab = true
opt.tabstop = 8
-- auto indent on new lines
opt.smartindent = true
opt.smarttab = true
opt.smartcase = true

-- disable nvim intro
opt.shortmess:append 'sI'
opt.shortmess:remove 'T'
-- don't add tildes where the line numbers end in small files
opt.fillchars = { eob = " " }

opt.autoread = true
-- persistently save undo history
opt.undofile = true

opt.clipboard = 'unnamedplus'

-- put splits into more familiar positions
opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.completeopt = 'menuone,noselect'

-- persistenly store info like the command history
vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)

-- having a signle venv is kinda hard to maintain with all the different tools
-- g.python3_host_prog = vim.fn.expand '$HOME' .. '/.local/share/nvim-venv/bin/python'
