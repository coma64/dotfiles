local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })

local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print 'Installing packer...'
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

  vim.cmd('packadd packer.nvim')
end

return require('packer').startup(function(use)
  -- let packer manage itself
  use 'wbthomason/packer.nvim'

  use {
    'chriskempson/base16-vim',
    config = function()
      vim.g.base16colorspace = 256
      vim.cmd 'colorscheme base16-tomorrow-night'
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = { 'vim', 'lua', 'python', 'css', 'html', 'javascript', 'typescript', 'regex', 'bash' },
        sync_install = false,
        highlight = {
          enable = true,
          use_languagetree = true,
        },
      }
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
    },
    config = function()
      local telescope = require 'telescope'
      telescope.load_extension 'fzf'
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {
  'L3MON4D3/LuaSnip',
  config = function ()
    require("luasnip.loaders.from_vscode").lazy_load()
    require('luasnip').filetype_extend('python', {'django'})
    print 'loaded luasnip'
  end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'rafamadriz/friendly-snippets',
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
    },
    config = function ()
      require 'user_config.plugins.configs.nvim_cmp'
    end,
  }

  use {
    'williamboman/nvim-lsp-installer',
    requires = { 'neovim/nvim-lspconfig' },
    after = 'nvim-cmp',
    config = function ()
      require("nvim-lsp-installer").setup {
        'pyright',
        'sumneko_lua',
      }

      require 'user_config.plugins.configs.lspconfig'
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
    config = function()
      require('nvim-tree').setup {}
    end,
  }

  use {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb" },
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'folke/which-key.nvim',
    after = 'telescope.nvim',
    config = function()
      require('which-key').setup {}
      require 'user_config.plugins.configs.which_key'
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
