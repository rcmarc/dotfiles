local packer = require('packer')

return packer.startup(function(use)
  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Status Line
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Themes
  use 'gruvbox-community/gruvbox'

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- -- Function overloads
  use 'Issafalcon/lsp-overloads.nvim'

  -- -- LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- -- vscode-like pictograms
  use 'onsails/lspkind.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'kyazdani42/nvim-web-devicons'

  -- LSP UIs
  use {
    "glepnir/lspsaga.nvim",
    branch = "main"
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Comments
  use 'numToStr/Comment.nvim'

  -- Snippets
  use 'rafamadriz/friendly-snippets'

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  -- -- Javascript
  use 'mxsdev/nvim-dap-vscode-js'
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'

end)
