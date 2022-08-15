local status, gits = pcall(require, 'gitsigns')
if (not status) then
  return
end

gits.setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 300
  }
}
