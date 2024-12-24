require("lazy").setup({
  defaults = {
    lazy = true,
    version = false,
  },
  ui = {
    border = "single",
  },
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "yugen" } },
  checker = { enabled = true },
})
