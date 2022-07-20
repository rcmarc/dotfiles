return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
  use 'joshdick/onedark.vim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ahmedkhalf/project.nvim'

  use 'kyazdani42/nvim-tree.lua'

  use 'preservim/nerdcommenter'

  use 'neovim/nvim-lspconfig'
  use 'lspcontainers/lspcontainers.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'sbdchd/neoformat'

  use 'windwp/nvim-autopairs'

  use 'chipsenkbeil/distant.nvim'

  use 'rafamadriz/friendly-snippets'
end)
