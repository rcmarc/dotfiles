local NODE_HOME = os.getenv('NODE_HOME')

vim.lsp.config('ts_ls', {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = NODE_HOME .. '/lib/node_modules/@vue/typescript-plugin',
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
})

vim.lsp.enable('ts_ls')
