return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  config = function()
    require("heirline").setup({
      statusline = require("plugins.heirline.statusline"),
    })
  end,
}
