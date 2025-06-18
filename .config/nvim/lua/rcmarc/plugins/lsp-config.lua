return {
	{
		"neovim/nvim-lspconfig",
		init = function()
			vim.diagnostic.config({
				update_in_insert = true
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local opts = { buffer = args.buf }
					vim.keymap.set("n", "gq", function() vim.lsp.buf.format() end, opts)
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
					vim.keymap.set("n", "gf", function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set("n", "gca", function() vim.lsp.buf.code_action() end, opts)
					vim.keymap.set("n", "grn", function() vim.lsp.buf.rename() end, opts)
					vim.keymap.set("n", "grf", function() vim.lsp.buf.references() end, opts)
					vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
					vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
					vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
				end
			})
		end
	},
}
