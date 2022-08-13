local function opt(key, value)
  vim.opt[key] = value
end

opt('number', true)
opt('title', true)
opt('hlsearch', true)
opt('shell', 'zsh')
opt('hidden', true)
opt('inccommand', 'split')
opt('smarttab', true)
opt('breakindent', true)
opt('ai', true)
opt('si', true)
opt('wrap', false)
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
opt('cursorline', true)
opt('termguicolors', true)
opt('completeopt', 'menu,menuone,noselect')

vim.opt.wildignore:append { '*/node_modules/*' }

vim.cmd('colorscheme tokyonight')
