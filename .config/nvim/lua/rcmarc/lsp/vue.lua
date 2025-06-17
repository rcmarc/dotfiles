local NODE_HOME = os.getenv('NODE_HOME')

vim.lsp.config('vue_ls', {
	cmd = { 'vue-language-server', '--stdio' },
	filetypes = { 'vue' },
	root_markers = { 'package.json' },
	-- https://github.com/vuejs/language-tools/blob/v2/packages/language-server/lib/types.ts
	init_options = {
		typescript = {
			-- replace with your global TypeScript library path
			tsdk = NODE_HOME .. '/lib/node_modules/typescript/lib',
		}
	},
	before_init = function(params, config)
		local lib_path = vim.fs.find('node_modules/typescript/lib', { path = new_root_dir, upward = true })
			[1]
		if lib_path then
			config.init_options.typescript.tsdk = lib_path
		end
	end
})

vim.lsp.enable('vue_ls')
