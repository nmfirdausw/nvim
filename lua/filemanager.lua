-- Install fyler.nvim, a file manager plugin
vim.pack.add({
  "https://github.com/FylerOrg/fyler.nvim"
}, { confirm = false })

local fyler = require("fyler")

-- Set up fyler with default config
fyler.setup({})

-- Open file manager
vim.keymap.set("n", "<BS>", fyler.open, { desc = "File Manager - Fyler" })
