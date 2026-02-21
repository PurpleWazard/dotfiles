return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()

      vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
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


      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      }


      local dap = require("dap")
      dap.configurations.c = {
        {
          name = "Launch",
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




    end,
  },
}
