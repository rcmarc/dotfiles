local mason = require('mason')
local mlsp = require('mason-lspconfig')
local utils = require('lspconfig.util')

mason.setup {}
mlsp.setup {
  ensure_installed = { 'lua_ls', 'tsserver', 'dockerls', 'bashls', 'cssls', 'angularls' }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

mlsp.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = OnAttach,
      capabilities = capabilities
    }
  end,
  ['csharp_ls'] = function()
    lspconfig['csharp_ls'].setup {
      on_attach = OnAttach,
      capabilities = capabilities,
    }
  end,
  ['angularls'] = function()
    lspconfig['angularls'].setup {
      on_attach = OnAttach,
      capabilities = capabilities,
      root_dir = utils.root_pattern('angular.json', 'project.json')
    }
  end,
  ['lua_ls'] = function()
    lspconfig['lua_ls'].setup {
      on_attach = OnAttach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end
}
