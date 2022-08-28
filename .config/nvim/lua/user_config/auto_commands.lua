local auto_cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup


auto_cmd('BufEnter', {
  pattern = '*.lua',
  callback = function()
    vim.opt.shiftwidth = 2
  end,
  group = augroup('lua', { clear = false }),
})

auto_cmd('BufWritePost', {
  pattern = '.vimrc.json',
  group = augroup('project-settings', { clear = false }),
  command = 'ProjectSettingsRegister',
})

auto_cmd('BufWritePost', {
  pattern = 'playground.lua',
  group = augroup('lua-playground', { clear = false }),
  callback = function (event)
    dofile(event.match)
  end
})

