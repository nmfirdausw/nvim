return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = false,
      style = "compact",
      icons = {
        error = " ●",
        warn = " ●",
        info = " ●",
        debug = " ●",
        trace = " ●",
      },
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    scroll = { enabled = false },
    scratch = { enable = false },
    styles = {
      notification = {
        border = "single",
      },
    },
  },
}
