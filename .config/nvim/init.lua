-- evilline
-- telescope

require 'plugins'
require 'settings'
require 'keymaps'
require 'gutils'
require 'autocommands'

vim.api.nvim_command('source ' .. vim.fn.stdpath('config') .. '/vimscript/commands.vim')
