return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  keys = {

    {"<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    {"<leader>fd", function() require("telescope.builtin").lsp_definitions() end, desc = "Find Defi,nitions" },
    {"<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Find Recent" },
    {"<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Find diagnost,ics" },
    {"<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Find in Files" },

    {"<leader>fm", function()
      require("telescope.builtin").man_pages({ sections = { "1", "2", "3", "9", "3type", "2type" } })
    end, desc = "Find man_pages" },

    {"<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
    {"<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find Help" }
  }
}
 -- config = function()
 --   local builtin = require("telescope.builtin")
 --   vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
 --   vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Find Definitions" })
 --   vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent" })
 --   vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
 --   vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in Files" })
 --   vim.keymap.set("n", "<leader>fm", function()
 --     builtin.man_pages({ sections = { "1", "2", "3", "9", "3type", "2type" } })
 --   end, { desc = "Find man_pages" })
 --   vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
 --   vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
 -- end,
--}
