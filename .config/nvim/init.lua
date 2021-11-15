-- evilline
-- telescope

require 'plugins'
require 'settings'
require 'keymaps'
require 'gutils'
require 'autocommands'

local config_dir = vim.fn.stdpath('config')

for _, file in pairs({'commands.vim', 'keymaps.vim'}) do
    vim.api.nvim_command('source ' ..  config_dir .. '/vimscript/commands.vim')
end

