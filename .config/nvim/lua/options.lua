local function opt(key, value)
  vim.opt[key] = value
end

opt('number', true)
opt('hidden', true)
opt('encoding', "utf-8")
opt('exrc', true)
opt('tabstop', 2)
opt('expandtab', true)
opt('shiftwidth', 2)
opt('relativenumber', true)
opt('wrap', false)
opt('scrolloff', 8)
opt('signcolumn', "yes")
opt('colorcolumn', "80")
opt('swapfile', false)

vim.g['airline_powerline_fonts'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1

vim.cmd('colorscheme onedark')
