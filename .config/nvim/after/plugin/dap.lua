local dap = require('dap')
local dap_js = require('dap-vscode-js')
local dap_ui = require('dapui')

dap_js.setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})
dap_ui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap_ui.close()
end

local opt = { silent = true }
vim.keymap.set('n', '<leader>D', ':lua require\'dap\'.continue()<cr>', opt)
vim.keymap.set('n', '<leader>B', ':lua require\'dap\'.toggle_breakpoint()<cr>', opt)
vim.keymap.set('n', '<leader>j', ':lua require\'dap\'.step_into()<cr>', opt)
vim.keymap.set('n', '<leader>l', ':lua require\'dap\'.step_over()<cr>', opt)

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require('dap.utils').pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end
