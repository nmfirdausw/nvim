return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufWritePre", "InsertEnter" },
    opts = function()
      return {
        keywords = {
          FIX = {
            icon = "○",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
          },
          TODO = {
            icon = "○",
            color = "hint",
          },
          HACK = {
            icon = "○",
            color = "warning",
          },
          WARN = {
            icon = "○",
            color = "warning",
            alt = { "WARNING", "XXX" },
          },
          PERF = {
            icon = "○",
            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
          },
          NOTE = {
            icon = "○",
            color = "info",
            alt = { "INFO" },
          },
          TEST = {
            icon = "○",
            color = "test",
            alt = { "TESTING", "PASSED", "FAILED" },
          },
        },
      }
    end,
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
