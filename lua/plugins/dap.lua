return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")
    if not dap.adapters["pwa-chrome"] then
      dap.adapters["pwa-chrome"] = {
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
    for _, lang in ipairs({
      "typescript",
      "javascript",
      "typescriptreact",
      "javascriptreact",
    }) do
      dap.configurations[lang] = dap.configurations[lang] or {}
      table.insert(dap.configurations[lang], {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome",
        url = "http://localhost:3000",
        sourceMaps = true,
      })
      table.insert(dap.configurations[lang], {
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
      })
    end
  end,
}
