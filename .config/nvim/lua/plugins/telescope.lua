return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Find Definitions" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in Files" })
    vim.keymap.set("n", "<leader>fm", function()
      builtin.man_pages({ sections = { "1", "2", "3", "9", "3type", "2type" } })
    end, { desc = "Find man_pages" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

    require("telescope").setup({
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          n = {
            ["qq"] = actions.close,
            ["x"] = actions.close,
            ["<esc>"] = actions.close,
          },
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<esc>"] = actions.close,
            ["xx"] = actions.close,
            ["qq"] = actions.close,
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    })
  end,
}
