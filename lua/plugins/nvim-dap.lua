return {
  "mfussenegger/nvim-dap",
  optional = true,
  config = function()
    local dap = require "dap"
    if not dap.adapters["pwa-node"] then
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    if not dap.adapters.node then
      dap.adapters.node = function(cb, config)
        if config.type == "node" then config.type = "pwa-node" end
        local pwa_adapter = dap.adapters["pwa-node"]
        if type(pwa_adapter) == "function" then
          pwa_adapter(cb, config)
        else
          cb(pwa_adapter)
        end
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
    local js_config = {
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
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
      {
        type = "node",
        request = "launch",
        name = "Debug Nest App",
        runtimeExecutable = "npx",
        runtimeArgs = {
          "nest",
          "start",
          "--debug",
          "--watch",
        },
        sourceMaps = true,
        -- The most important part is outFiles. It allows VS code to find your source maps that are generated in the dist folder.
        outFiles = { "${workspaceFolder}/dist/**/*.js" },
        cwd = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**" },
        console = "integratedTerminal",
      },
    }

    for _, language in ipairs(js_filetypes) do
      if not dap.configurations[language] then dap.configurations[language] = js_config end
    end

    local vscode_filetypes = require("dap.ext.vscode").type_to_filetypes
    vscode_filetypes["node"] = js_filetypes
    vscode_filetypes["pwa-node"] = js_filetypes
  end,
}
