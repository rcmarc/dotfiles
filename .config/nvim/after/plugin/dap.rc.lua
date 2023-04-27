local dap = require('dap')
local dap_js = require('dap-vscode-js')
local dap_ui = require('dapui')

dap_js.setup {
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
}
dap_ui.setup {}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap_ui.close()
end

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
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end
