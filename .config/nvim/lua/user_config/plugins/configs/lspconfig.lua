local lspconfig = require 'lspconfig'

lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        -- pylint integration doesn't work properly with pyenv
        -- pylint = { enabled = true, },
        rope_completion = { enabled = true },
      },
    },
  },
}

lspconfig.pyright.setup {
  settings = {
    pyright = {
      disableLanguageServices = true,
    },
  },
}

lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
