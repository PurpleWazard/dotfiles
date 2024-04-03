return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "open_current",
        hide_dotfiles = false,
      }
    })
    vim.keymap.set("n", "<leader>ee", "<cmd>Neotree filesystem toggle left<CR>")
    vim.keymap.set("n", "<leader>ef", "<cmd>Neotree filesystem focus left<CR>")
  end
}
