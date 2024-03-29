local mason = require('mason')
local mlsp = require('mason-lspconfig')
local utils = require('lspconfig.util')

mason.setup()
mlsp.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local function on_attach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gd', ':Lspsaga peek_definition<cr>', bufopts)
  vim.keymap.set('n', 'K', ':Lspsaga hover_doc<cr>', bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', ':Lspsaga rename<cr>', bufopts)
  vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<cr>', bufopts)
  vim.keymap.set('n', 'gr', ':Lspsaga lsp_finder<cr>', bufopts)
  vim.keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)

  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, {})
  end
end

mlsp.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities
    }
  end,
  ['csharp_ls'] = function()
    lspconfig['csharp_ls'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ['angularls'] = function()
    lspconfig['angularls'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = utils.root_pattern('angular.json', 'project.json')
    }
  end,
  ['lua_ls'] = function()
    lspconfig['lua_ls'].setup {
      on_attach = on_attach,
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

