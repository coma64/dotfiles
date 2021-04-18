require 'settings'
require 'plugins'

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

vim.api.nvim_command 'source /home/coma/.config/nvim/init.vim'
