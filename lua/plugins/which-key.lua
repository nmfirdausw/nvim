return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      mappings = false,
      separator = "󱦰",
    },
    win = {
      border = "single",
    },
    spec = {
      { "<leader>g", group = "Git" },
      { "<leader>gt", group = "Toggle" },
    },
  },
}
