local keymap = vim.keymap

-- Do not yank with 'x'
keymap.set('n', 'x', '"_x')

-- Select all
keymap.set('n', '<C-a>', 'ggVG')

-- New tab
keymap.set('n', '<leader>te', ':tabedit<cr>', { silent = true })

-- New split
keymap.set('n', '<leader>ss', ':split<cr><C-w>w', { silent = true })
keymap.set('n', '<leader>sv', ':vsplit<cr><C-w>w', { silent = true })

-- Focus
keymap.set('t', '<Esc>', '<C-\\><C-n>')
keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h')
keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j')
keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k')
keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l')
keymap.set('n', '<A-h>', '<C-w>h')
keymap.set('n', '<A-j>', '<C-w>j')
keymap.set('n', '<A-k>', '<C-w>k')
keymap.set('n', '<A-l>', '<C-w>l')

keymap.set('i', '<C-c>', '<Esc>')

-- Resize
keymap.set('n', '<C-w><left>', '5<C-w>>')
keymap.set('n', '<C-w><right>', '5<C-w><')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Remove search highlight
keymap.set('n', '<leader>h', ':nohlsearch<cr>', { silent = true })

-- Navigate throught buffers
keymap.set('n', '<leader><Tab>', ':bnext<cr>', { silent = true })
keymap.set('n', '<leader><S-Tab>', ':bprevious<cr>', { silent = true })

-- Save buffer
keymap.set('n', '<C-s>', ':w<cr>')
keymap.set('v', '<C-s>', ':w<cr>')
keymap.set('i', '<C-s>', '<C-c>:w<cr>i')

-- Delete buffer
keymap.set('n', '<leader>bd', ':bdelete!<cr>')

-- Telescope
local telescope = require('telescope.builtin')
keymap.set('n', '<leader>ff', telescope.find_files, {})
keymap.set('n', '<leader>fb', telescope.buffers, {})

-- Toggle Explorer
keymap.set('n', '<leader>ee', ':NvimTreeToggle<cr>')

-- Toggle Trouble
keymap.set('n', '<leader>T', ':TroubleToggle<cr>')

-- Terminal
keymap.set('n', '<leader>tt', ':ToggleTerm<cr>')

-- Debug
local opt = { silent = true }
keymap.set('n', '<leader>D', ':lua require\'dap\'.continue()<cr>', opt)
keymap.set('n', '<leader>B', ':lua require\'dap\'.toggle_breakpoint()<cr>', opt)
keymap.set('n', '<leader>j', ':lua require\'dap\'.step_into()<cr>', opt)
keymap.set('n', '<leader>l', ':lua require\'dap\'.step_over()<cr>', opt)

-- Snippets
local opts = { noremap = true, silent = true }
keymap.set('i', '<Tab>', 'luasnip#expand_or_jumpable() ? \'<Plug>luasnip-expand-or-jump\' : \'<Tab>\'',
  { silent = true, expr = true })
keymap.set('i', '<S-Tab>', '<cmd>lua require(\'luasnip\').jump(-1)<cr>', opts)
keymap.set('s', '<S-Tab>', '<cmd>lua require(\'luasnip\').jump(-1)<cr>', opts)
keymap.set('s', '<Tab>', '<cmd>lua require(\'luasnip\').jump(1)<cr>', opts)

-- Overloads
keymap.set('n', '<S-Tab>', ':LspOverloadsSignature<CR>', opts)

-- Diagnostics
keymap.set('n', '<leader>d', ':Lspsaga show_line_diagnostics<cr>', opts)
keymap.set("n", "[e", ":Lspsaga diagnostic_jump_next<cr>", { silent = true })
keymap.set("n", "]e", ":Lspsaga diagnostic_jump_prev<cr>", { silent = true })

function OnAttach(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set('n', 'gD', vim.lsp.buf.definition, bufopts)
  keymap.set('n', 'gd', ':Lspsaga peek_definition<cr>', bufopts)
  keymap.set('n', 'K', ':Lspsaga hover_doc<cr>', bufopts)
  keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap.set('n', '<leader>rn', ':Lspsaga rename<cr>', bufopts)
  keymap.set('n', '<leader>ca', ':Lspsaga code_action<cr>', bufopts)
  keymap.set('n', 'gr', ':Lspsaga lsp_finder<cr>', bufopts)
  keymap.set('n', '<leader>F', function() vim.lsp.buf.format { async = true } end, bufopts)

  if client.server_capabilities.signatureHelpProvider then
    require('lsp-overloads').setup(client, {})
  end

  if client.name == "omnisharp" then

    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }
  end
end
