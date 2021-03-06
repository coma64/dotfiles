-- set completeopt-=preview
-- .o .wo unterschiede

if vim.fn.exists('+termguicolors') then
  vim.o.t_8f = '\\<Esc>[38;2;%lu;%lu;%lum'
  vim.o.t_8b = '\\<Esc>[48;2;%lu;%lu;%lum'
  vim.o.termguicolors = true
end

vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('highlight ColorColumn ctermbg=grey guibg=grey')
vim.api.nvim_command('syntax enable')

vim.o.background = 'dark'
vim.o.backup = false
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 2
vim.o.compatible = false
vim.o.completeopt = 'menu'
vim.o.expandtab = true
vim.o.foldenable = false
vim.o.foldmethod = 'indent'
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.lcs = 'eol:¬,space:·,tab:――⇀'
vim.o.list = true
vim.o.ls = 2
vim.o.scrolloff = 0
vim.o.shiftwidth = 4
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.undodir = vim.fn.stdpath('cache') .. '/undodir'
vim.o.undofile = true
vim.bo.undofile = true
vim.o.updatetime = 50
vim.o.wildmode = 'list:longest'
vim.o.wrap = false
vim.o.writebackup = false
vim.wo.colorcolumn = '100'
vim.wo.number = true
vim.wo.relativenumber = true --makes zsh syntax highlighting laggy
vim.wo.signcolumn = 'yes'

-- Theme
vim.g.Vsd = { contrast = 2 }
vim.api.nvim_command('colorscheme tomorrow_eighties')

-- Airline
vim.g.airline_powerline_fonts = 1
vim.g.airline_extensions_whitespace_enabled = 0
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_theme = 'neodark'

-- fzf
vim.g.fzf_layout = { window = { width = 0.8, height = 0.4 } }

-- polyglot
vim.g.polyglot_disabled = { 'sh', 'zinit' }

-- vim-rainbow
vim.g.rainbow_active = true

-- vimspector
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'

-- coc
vim.g.coc_global_extensions = {
    'coc-clangd',
    'coc-cmake',
    'coc-emmet',
    'coc-explorer',
    'coc-git',
    'coc-html',
    'coc-json',
    'coc-lists',
    'coc-markdownlint',
    'coc-pyright',
    'coc-python',
    'coc-sh',
    'coc-toml',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-xml',
    'coc-yaml'
}
vim.g.python3_host_prog = '/home/coma/.cache/pypoetry/virtualenvs/py3nvim-qpdfuwg7-py3.9/bin/python'

-- vimspector
vim.g.vimspector_install_gadgets = {
  'debugpy',
  'vscode-cpptools'
}
