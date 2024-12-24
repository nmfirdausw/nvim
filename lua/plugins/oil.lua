return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  opts = {
    delete_to_trash = true,
    confirmation = {
      border = "single",
    },
    columns = {
      {
        "icon",
        add_padding = false,
        directory = "○",
      },
    },
  },
}
