local status, snippets = pcall(require, 'luasnip.loaders.from_vscode')
if (not status) then
  return
end

snippets.lazy_load {}
