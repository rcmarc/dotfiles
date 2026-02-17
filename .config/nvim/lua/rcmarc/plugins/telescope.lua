return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
	},
	opts = function()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', function() builtin.find_files { hidden = true } end,
			{ desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fgt', builtin.git_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fgr', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	end
}
