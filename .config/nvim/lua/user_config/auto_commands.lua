local auto_cmd = vim.api.nvim_create_autocmd

auto_cmd('BufEnter', {
  pattern = '*.lua',
  callback = function()
    vim.opt.shiftwidth = 2
  end,
})

