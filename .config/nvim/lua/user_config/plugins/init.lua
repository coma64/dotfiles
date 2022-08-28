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
    'VonHeikemen/project-settings.nvim',
    config = function()
      require 'user_config.plugins.configs.project_settings'
    end,
  }

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
    branch = '347aaa95',
    config = function()
      local success, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
      if not success then return end

      treesitter_configs.setup {
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
      local success, telescope = pcall(require, 'telescope')
      if not success then return end
      telescope.load_extension 'fzf'
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      local success, gitsigns = pcall(require, 'gitsigns')
      if not success then return end
      gitsigns.setup()
    end,
  }

  use 'kdheepak/lazygit.nvim'

  use {
  'L3MON4D3/LuaSnip',
  config = function ()
    local success, luasnip = pcall(require, 'luasnip')
    if not success then return end
    local success2, from_vscode = pcall(require, 'luasnip.loaders.from_vscode')
    if not success2 then return end
    from_vscode.lazy_load()
    luasnip.filetype_extend('python', {'django'})
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
      'onsails/lspkind.nvim',
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
      local success, lsp_installer = pcall(require, "nvim-lsp-installer")

      if not success then return end
      lsp_installer.setup {
        'pyright',
        'sumneko_lua',
        'tsserver',
        'angularls',
        'svelte',
        'gopls',
      }

      require 'user_config.plugins.configs.lspconfig'
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      local success, autopairs = pcall(require, "nvim-autopairs")
      if not success then return end
      autopairs.setup({})
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly',
    config = function()
      local success, nvim_tree = pcall(require, "nvim-tree")
      if not success then return end
      nvim_tree.setup({})
    end,
  }

  use {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb" },
    config = function()
      local success, comment = pcall(require, "Comment")
      if not success then return end
      comment.setup()
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
    config = function()
      local success, toggleterm = pcall(require, "toggleterm")
      if not success then return end
      toggleterm.setup({
        open_mapping = "<C-t>",
        insert_mappings = true,
        terminal_mappings = true,
        start_in_insert = false,
        winbar = {
          enabled = false,
        },
      })
    end
  }

  use 'puremourning/vimspector'

  use {
    'folke/which-key.nvim',
    after = 'telescope.nvim',
    config = function()
      local success, which_key = pcall(require, "which-key")
      if not success then return end
      which_key.setup({})
      require 'user_config.plugins.configs.which_key'
    end,
  }

  if packer_bootstrap then
    local success, packer = pcall(require, "packer")
    if not success then return end
    packer.sync()
  end
end)
