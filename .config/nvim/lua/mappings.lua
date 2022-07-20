local function noremap(mode, lhs, rhs, bufopts)
  bufopts = bufopts or {noremap = true}
  vim.keymap.set(mode, lhs, rhs, {noremap=true})
end

noremap('n', '<leader>ff', ':Telescope find_files<cr>')
noremap('n', '<leader>fb', ':Telescope buffers<cr>')
noremap('n', '<leader>fp', ':Telescope projects<cr>')

noremap('n', '<leader>ee', ':NvimTreeFocus<cr>')
noremap('n', '<leader>ew', ':NvimTreeClose<cr>')
noremap('n', '<leader>er', ':NvimTreeRefresh<cr>')

noremap('n', '<leader><TAB>', ':bNext<cr>')
noremap('n', '<leader><bf>', ':bfirst<cr>')

noremap('n', '<leader>bd', ':bdelete!<cr>')

noremap('n', '<leader>tt', ':terminal<cr>')
noremap('t', '<Esc>', '<C-\\><C-n>')
noremap('t', '<A-h>', '<C-\\><C-N><C-w>h')
noremap('t', '<A-j>', '<C-\\><C-N><C-w>j')
noremap('t', '<A-k>', '<C-\\><C-N><C-w>k')
noremap('t', '<A-l>', '<C-\\><C-N><C-w>l')
noremap('n', '<A-h>', '<C-w>h')
noremap('n', '<A-j>', '<C-w>j')
noremap('n', '<A-k>', '<C-w>k')
noremap('n', '<A-l>', '<C-w>l')

noremap('n', '<leader>I', ':Neoformat<cr>')
noremap('v', '<leader>I', ':Neoformat<cr>')

noremap('n', '<C-s>', ':w<cr>')
noremap('v', '<C-s>', ':w<cr>')
noremap('i', '<C-s>', '<C-c>:w<cr>i')

function OnAttach(_, bufnr)

  local opts = { noremap=true, silent=true }
  noremap('n', '<space>e', vim.diagnostic.open_float, opts)
  noremap('n', '[d', vim.diagnostic.goto_prev, opts)
  noremap('n', ']d', vim.diagnostic.goto_next, opts)
  noremap('n', '<space>q', vim.diagnostic.setloclist, opts)

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  noremap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  noremap('n', 'gd', vim.lsp.buf.definition, bufopts)
  noremap('n', 'K', vim.lsp.buf.hover, bufopts)
  noremap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  noremap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  noremap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  noremap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  noremap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  noremap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  noremap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  noremap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  noremap('n', 'gr', vim.lsp.buf.references, bufopts)
  noremap('n', '<space>f', vim.lsp.buf.formatting, bufopts)

end

--snippets 

local opts = {noremap=true, silent=true}

vim.keymap.set('i', '<Tab>', 'luasnip#expand_or_jumpable() ? \'<Plug>luasnip-expand-or-jump\' : \'<Tab>\'')
noremap('i', '<S-Tab>', '<cmd>lua require(\'luasnip\').jump(-1)<cr>', opts)
noremap('s', '<S-Tab>', '<cmd>lua require(\'luasnip\').jump(-1)<cr>', opts)
noremap('s', '<Tab>', '<cmd>lua require(\'luasnip\').jump(1)<cr>', opts)
