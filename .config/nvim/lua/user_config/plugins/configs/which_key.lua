local telescope = require 'telescope.builtin'
local which_key = require 'which-key'
local lazygit = require 'lazygit'
local utils = require 'user_config.utils'
local lsp = vim.lsp

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function get_text_by_position(start_row, start_col, stop_row, stop_col)
  return vim.api.nvim_buf_get_text(0, start_row, start_col, stop_row, stop_col, {})
end

local function create_lua_operator_func(opts)
  -- opts: { old_operator_func, override_fn, call_with_text }
  return function()
    local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, '['))
    local stop_row, stop_col = unpack(vim.api.nvim_buf_get_mark(0, ']'))

    if opts.call_with_text then
      opts.override_fn(get_text_by_position(start_row - 1, start_col, stop_row - 1, stop_col + 1))
    else
      opts.override_fn(start_row, start_col, stop_row, stop_col)
    end

    -- Restore
    vim.go.operatorfunc = opts.old_operator_func
  end
end

local function lua_operator(opts)
  -- opts: { [0] = override_fn, call_with_text }
  return function()
    _G.lua_operator_func_override = create_lua_operator_func({
      old_operator_func = vim.go.operatorfunc,
      override_fn = opts[1],
      call_with_text = opts.call_with_text,
    })
    vim.go.operatorfunc = 'v:lua.lua_operator_func_override'
    vim.api.nvim_feedkeys('g@', 'n', false)
  end
end

local function lua_visual(opts)
  -- opts: { [0] = override_fn, call_with_text }
  return function()
    local _, start_row, start_col, _ = unpack(vim.fn.getpos('v'))
    local _, stop_row, stop_col, _ = unpack(vim.fn.getpos('.'))
    print(start_row, start_col)
    print(stop_row, stop_col)

    if opts.call_with_text then
      opts[1](get_text_by_position(start_row - 1, start_col - 1, stop_row - 1, stop_col))
    else
      opts[1](start_row, start_col, stop_row, stop_col)
    end
  end
end

which_key.register({
  ['<C-h>'] = { '<C-w>h', ' Window left' },
  ['<C-j>'] = { '<C-w>j', ' Window down' },
  ['<C-k>'] = { '<C-w>k', ' Window up' },
  ['<C-l>'] = { '<C-w>l', ' Window right' },

  -- location list - used by lsp diagnostics
  ['<F12>'] = { '<cmd> :lnext <cr>', 'Diagnostic next' },
  ['<F11>'] = { '<cmd> :lprevious <cr>', 'Diagnostic previous' },

  ["<ESC>"] = { "<cmd> noh <CR>", "  no highlight" },
  ['<C-b>'] = { '<cmd> NvimTreeToggle <cr>', 'Open file browser' },
  ['<C-n>'] = { '<cmd> tabnext <cr>', 'Tab next' },
  ['<C-p>'] = { '<cmd> tabprevious <cr>', 'Tab previous' },

  g = {
    name = 'Goto',
    d = { lsp.buf.definition, "  LSP definition" },
    D = { lsp.buf.declaration, "  LSP declaration" },
    i = { lsp.buf.implementation, "  LSP implementation" },
    u = { lsp.buf.references, "  LSP usages" },
    r = {
      lua_operator({
        utils.search_dotted_path,
        call_with_text = true,
      }),
      'Resolve dotted path',
    },
  },
  K = { lsp.buf.hover, "  LSP hover" },
  R = { utils.rename, "  LSP rename" },

  ['<leader>'] = {
    g = {
      g = { lazygit.lazygit, 'Lazygit' },
    },
    f = {
      name = 'Find',
      f = { telescope.find_files, 'Files' },
      g = { telescope.live_grep, 'Words' },
      b = { telescope.buffers, 'Buffers' },
      h = { telescope.help_tags, 'Help tags' },
      o = { telescope.oldfiles, 'Recently used files' },
    },
    r = { utils.reload_config, 'Reload config' },
    x = { '<cmd> :q <cr>', 'Close current buffer' },
    o = { '<cmd> :only <cr>', 'Close other windows' },

    -- lsp
    l = {
      name = '  LSP',
      s = { lsp.buf.signature_help, "Signature" },
      a = { lsp.buf.code_action, "Action" },
      d = { vim.diagnostic.open_float, "Diagnostics" },
      f = {
        function()
          lsp.buf.format { async = true }
        end,
        "Format",
      },
      t = { lsp.buf.type_definition, "Show type definitions" },
      l = { vim.diagnostic.setloclist, "Set location list" },
    },
    w = {
      name = ' LSP Workspaces',
      a = { lsp.buf.add_workspace_folder, "Add folder" },
      r = { lsp.buf.remove_workspace_folder, "Remove folder" },
      l = {
        function()
          print(vim.inspect(lsp.buf.list_workspace_folders()))
        end,
        "List folders"
      },
    },
  },
}, { mode = 'n' })

which_key.register({
  -- go to  beginning and end
  ["<C-a>"] = { "<esc>^i", "論 beginning of line" },
  ["<C-e>"] = { "<end>", "壟 end of line" },

  -- navigate within insert mode
  ["<C-h>"] = { "<Left>", "  move left" },
  ["<C-l>"] = { "<Right>", " move right" },
  ["<C-j>"] = { "<Down>", " move down" },
  ["<C-k>"] = { "<Up>", " move up" },

  ["<C-d>"] = { "<Del>", "Delete a character" },

  ['<C-n>'] = { '<esc><cmd> tabnext <cr>', 'Tab next' },
  ['<C-p>'] = { '<esc><cmd> tabprevious <cr>', 'Tab previous' },
}, { mode = 'i' })

which_key.register({
  g = {
    p = {
      lua_visual({
        utils.search_dotted_path,
        call_with_text = true,
      }),
      'Print',
    }
  }
}, { mode = 'v' })

which_key.register({
  ['<C-x>'] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
}, { mode = 't' })
