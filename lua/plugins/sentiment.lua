return {
  "utilyre/sentiment.nvim",
  version = "*",
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
  init = function()
    vim.g.loaded_matchparen = 1
  end,
}
