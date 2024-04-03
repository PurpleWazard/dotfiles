return {

  -- tmux navigation
  {
    "christoomey/vim-tmux-navigator",
    config = function()
      -tmux
      vim.keymap.set("n", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move left" })
      vim.keymap.set("n", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move down" })
      vim.keymap.set("n", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move up" })
      vim.keymap.set("n", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move right" })


      --window keymaps
      vim.keymap.set("n", "<leader>ex", [[<Cmd>close<CR>]])

      vim.keymap.set("n", "<leader>ev", function()
        vim.cmd("vsplit")
      end)

      vim.keymap.set("n", "<leader>eh", function()
        vim.cmd("split")
      end)

      -- buffer keymaps

      vim.keymap.set("n", "<leader>q", [[<Cmd>bd<CR>]])
    end
  },


  -- bufferline config
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
      require("bufferline").setup({
        options = {
          --mode = "buffers",
          mode = "tabs",
          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              separator = true,
              text_align = "left",
            },
          },
          diagnostics = "nvim_lsp",
          numbers = "buffer_id",
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        }
      })

      --cycle throught tab or buffers
      vim.keymap.set("n", "L", [[<Cmd>BufferLineCycleNext<CR>]])
      vim.keymap.set("n", "H", [[<Cmd>BufferLineCyclePrev<CR>]])

      --move tabs or buffers
      vim.keymap.set("n", "<leader>L", [[<Cmd>BufferLineMoveNext<CR>]])
      vim.keymap.set("n", "<leader>H", [[<Cmd>BufferLineMovePrev<CR>]])
    end,
  },

  --toggleterm config
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        size = 10,
      })
    end,
  },



}
