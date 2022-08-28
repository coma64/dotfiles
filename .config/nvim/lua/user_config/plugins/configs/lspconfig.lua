local lspconfig = require 'lspconfig'

-- nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup({})
lspconfig.angularls.setup({})
lspconfig.svelte.setup({})
lspconfig.gopls.setup({})

lspconfig.pylsp.setup{
  capabilities = capabilities,
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
  capabilities = capabilities,
  settings = {
    pyright = {
      disableLanguageServices = true,
    },
  },
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
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
