-- Do not yank with 'x'
vim.keymap.set('n', 'x', '"_x')

-- Select all
vim.keymap.set('n', '<C-a>', 'ggVG')

-- New tab
vim.keymap.set('n', '<leader>te', ':tabedit<cr>', { silent = true })

-- New split
vim.keymap.set('n', '<leader>ss', ':split<cr><C-w>w', { silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<cr><C-w>w', { silent = true })

-- Focus
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

vim.keymap.set('i', '<C-c>', '<Esc>')

-- Resize
vim.keymap.set('n', '<C-w><left>', '5<C-w>>')
vim.keymap.set('n', '<C-w><right>', '5<C-w><')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')

-- Remove search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<cr>', { silent = true })

-- Navigate throught buffers
vim.keymap.set('n', '<leader><Tab>', ':bnext<cr>', { silent = true })
vim.keymap.set('n', '<leader><S-Tab>', ':bprevious<cr>', { silent = true })

-- Save buffer
vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('v', '<C-s>', ':w<cr>')
vim.keymap.set('i', '<C-s>', '<C-c>:w<cr>i')

-- Delete buffer
vim.keymap.set('n', '<leader>bd', ':bdelete!<cr>')

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.git_files, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})

-- Toggle Explorer
vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<cr>')

local opts = { noremap = true, silent = true }

-- Overloads
vim.keymap.set('n', '<S-Tab>', ':LspOverloadsSignature<CR>', opts)

-- Diagnostics
vim.keymap.set('n', '<leader>d', ':Lspsaga show_line_diagnostics<cr>', opts)
vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_next<cr>", { silent = true })
vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_prev<cr>", { silent = true })

