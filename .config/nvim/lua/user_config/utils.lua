local M = {}

function M.reload_config()
  for name,_ in pairs(package.loaded) do
    if name:match('^user_config') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)

  -- Only compile because install won't work :/
  require('packer').compile()
  -- Reload mappings
  require('which-key').reset()
  require 'user_config.plugin_configs.which_key'
end

function M.rename()
  -- credits to @Malace : https://www.reddit.com/r/neovim/comments/ql4iuj/rename_hover_including_window_title_and/
  -- This is modified version of the above snippet
  local currName = vim.fn.expand "<cword>" .. " "

  local win = require("plenary.popup").create(currName, {
    title = "Renamer",
    style = "minimal",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    relative = "cursor",
    borderhighlight = "RenamerBorder",
    titlehighlight = "RenamerTitle",
    focusable = true,
    width = 25,
    height = 1,
    line = "cursor+2",
    col = "cursor-1",
  })

  local map_opts = { noremap = true, silent = true }

  vim.cmd "normal w"
  vim.cmd "startinsert"

  vim.api.nvim_buf_set_keymap(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
  vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)

  vim.api.nvim_buf_set_keymap(
    0,
    "i",
    "<CR>",
    "<cmd>stopinsert | lua require'utils'.rename_apply(" .. currName .. "," .. win .. ")<CR>",
    map_opts
  )

  vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<CR>",
    "<cmd>stopinsert | lua require'utils'.rename_apply(" .. currName .. "," .. win .. ")<CR>",
    map_opts
  )
end

function M.rename_apply(curr, win)
   local newName = vim.trim(vim.fn.getline ".")
   vim.api.nvim_win_close(win, true)

   if #newName > 0 and newName ~= curr then
      local params = vim.lsp.util.make_position_params()
      params.newName = newName

      vim.lsp.buf_request(0, "textDocument/rename", params)
   end
end

function M.search_dotted_path(path)
  require('telescope.builtin').find_files({ default_text=path[1]:gsub('%.', '/') })
end

for name, fn in pairs(M) do
  _G[name] = fn
end

return M
