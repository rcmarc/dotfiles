for l in io.popen([[ls $HOME/.config/nvim/lua/rcmarc/lsp]]):lines() do
	local mod = string.sub(l, 0, string.len(l) - 4)
	require('rcmarc.lsp.' .. mod)
end
