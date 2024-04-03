return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        --mode = "tabs",
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

    vim.keymap.set("n", "<leader>bb", [[<Cmd>BufferLinePick<CR>]])

    vim.keymap.set("n", "<leader>l", [[<Cmd>BufferLineCycleNext<CR>]])
    vim.keymap.set("n", "<leader>h", [[<Cmd>BufferLineCyclePrev<CR>]])

    vim.keymap.set("n", "<leader>L", [[<Cmd>BufferLineMoveNext<CR>]])
    vim.keymap.set("n", "<leader>H", [[<Cmd>BufferLineMovePrev<CR>]])
  end,
}
