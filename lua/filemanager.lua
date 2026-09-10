-- Install fyler.nvim, a file manager plugin
vim.pack.add({
  "https://github.com/FylerOrg/fyler.nvim"
}, { confirm = false })

local fyler = require("fyler")

-- Set up fyler with default config
fyler.setup({
  mappings = {
    n = {
      ["<BS>"] = {
        action = "visit",
        args = { parent = true },
        desc = "Go to parent directory",
      },
      ["-"] = {
        action = "shrink",
        args = { parent = true },
        desc = "Collapse parent directory",
      },
    },
  },
})

-- Open file manager
vim.keymap.set("n", "<BS>", fyler.open, { desc = "File Manager - Fyler" })
