return {
 "nvim-neorg/neorg",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      config = true,
    }
  },
  cmd = "Neorg",
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
