return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'jonarrien/telescope-cmdline.nvim',
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = "dropdown"
        }
      },
      extensions = {
        fzf = {},
        cmdline = {}
      }
    }
    require('telescope').load_extension('fzf')
    require("telescope").load_extension('cmdline')


    -- vim.keymap.set("n", ":", "<cmd>Telescope cmdline<cr>", { desc = ": opens cmdline" })
    vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Find Help pages for Neovim" })
    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Find files in the Dir" })
    vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Find by Grep" })
  end
}
