-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
local packer = require 'packer'

-- Specify packages
packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mg979/vim-studio-dark'
  use 'KeitaNakamura/neodark.vim'
  use 'chrisbra/Colorizer'
  use 'cohama/lexima.vim'
  use 'frazrepo/vim-rainbow'
  use 'ghifarit53/tokyonight-vim'
  use 'preservim/tagbar'
  use 'rhysd/clever-f.vim'
  use 'sheerun/vim-polyglot'
  use 'simnalamburt/vim-mundo'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'

  use {
    'neoclide/coc.nvim/',
    branch = 'release'
  }

  -- Lazy loading:
  use {
    'tpope/vim-dispatch',
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' },
    opt = true
  }

  use {
    '~/.fzf',
    requires = {'junegunn/fzf.vim'},
    cmd = {
      'Files',
      'GFiles',
      'GFiles',
      'Buffers',
      'Colors',
      'Ag',
      'Rg',
      'Lines',
      'BLines',
      'Tags',
      'BTags',
      'Marks',
      'Windows',
      'Locate',
      'History',
      'History',
      'History',
      'Snippets',
      'Commits',
      'BCommits',
      'Commands',
      'Maps',
      'Helptags',
      'Filetypes'
    },
    opt = true
  }

  use {
    'puremourning/vimspector',
    cmd = 'VimspectorContinue',
    opt = true
  }
end)
