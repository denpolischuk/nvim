return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<C-S>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
