require('nvim-autopairs').setup {}
require('telescope').load_extension('projects')
require('nvim-tree').setup {}
require('nvim-treesitter.configs').setup {
  highlight = {
		enable = true
	}
}
require('distant').setup {
  ['*'] = require('distant.settings').chip_default()
}
