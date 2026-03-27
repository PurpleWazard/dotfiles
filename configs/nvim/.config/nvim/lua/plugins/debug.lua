return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      {
        'Joakker/lua-json5',
        build = './install.sh',
      },
      "jedrzejboczar/nvim-dap-cortex-debug",

    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      dap.set_log_level('TRACE')

      require("dapui").setup()

      vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>dd", require("dapui").toggle)
      vim.keymap.set("n", "<space>dc", dap.continue)
      vim.keymap.set('n', '<leader>do', dap.step_over)
      vim.keymap.set('n', '<leader>di', dap.step_into)
      vim.keymap.set('n', '<leader>du', dap.step_out)
      vim.keymap.set('n', '<Leader>dr', dap.repl.open)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      dap.adapters.godot = {
        type = "server",
        host = '127.0.0.1',
        port = 6006,
      }

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      }

      dap.configurations.c = {
        {
          name = "Launch GDB",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          args = {}, -- provide arguments if needed
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }


      --------------------------------

      -- require('dap.ext.vscode').json_decode = require 'json5'.parse
      -- require('dap.ext.vscode').load_launchjs(nil, { ["cortex-debug"] = { 'c', 'cpp' } })

      require('dap-cortex-debug').setup {
        debug = false, -- log debug messages
        -- path to cortex-debug extension, supports vim.fn.glob
        -- by default tries to guess: mason.nvim or VSCode extensions
        extension_path = nil,
        lib_extension = nil, -- shared libraries extension, tries auto-detecting, e.g. 'so' on unix
        node_path = 'node',  -- path to node.js executable
        dapui_rtt = true,    -- register nvim-dap-ui RTT element
        -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
        dap_vscode_filetypes = { 'c', 'cpp' },
        rtt = {
          buftype = 'Terminal', -- 'Terminal' or 'BufTerminal' for terminal buffer vs normal buffer
        },
      }
    end,
  },
}
