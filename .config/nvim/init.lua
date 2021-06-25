-- evilline
-- telescope

require 'settings'
require 'plugins'
require 'keymaps'
require 'gutils'
require 'autocommands'

vim.api.nvim_command('source ' .. vim.fn.stdpath('config') .. '/vimscript/commands.vim')
