local dir = vim.loop.fs_scandir('.')
print(vim.inspect(dir))

-- print(vim.inspect(vim.loop))

local ins = function(value) print(vim.inspect(value)) end
ins(vim.loop.fs_readdir(vim.loop.fs_opendir))
