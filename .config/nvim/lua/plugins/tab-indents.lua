return {
  event = "BufEnter",
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup()
  end,
}
