return {
	{
		"neovim/nvim-lspconfig",
		init = function ()
			vim.api.nvim_create_autocmd('LspAttach', {
				callback =function (args)
					local opts = { buffer = args.buf }
					vim.keymap.set("n", "<leader>gq", function() vim.lsp.buf.format() end, opts)
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
					vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
					vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
					vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
					vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
					vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
					vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
					vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
				end
			})
		end
	},
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
		init = function()
			require("mason-lspconfig").setup_handlers {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig")[server_name].setup {
						capabilities = capabilities,
					}
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				-- ["rust_analyzer"] = function ()
				--		require("rust-tools").setup {}
				-- end.
				["lua_ls"] = function()
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig")["lua_ls"].setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { 'vim' }
								}
							}
						}
					}
				end
			}
		end
	}
}
