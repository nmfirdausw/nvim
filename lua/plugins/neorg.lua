return {
 "nvim-neorg/neorg",
  dependencies = { "luarocks.nvim" },
  lazy = false,
  version = false,
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/Notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }
  end
}
