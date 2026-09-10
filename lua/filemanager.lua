-- Install fyler.nvim, a file manager plugin
vim.pack.add({
  "https://github.com/FylerOrg/fyler.nvim"
}, { confirm = false })

local fyler = require("fyler")

-- WORKAROUND for https://github.com/FylerOrg/fyler.nvim/issues/366
-- TODO: remove once #366 is fixed upstream.
local pre_open_buf

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
      ["q"] = {
        action = function(instance)
          instance:close()

          if
            pre_open_buf
            and vim.api.nvim_buf_is_valid(pre_open_buf)
            and vim.api.nvim_get_current_buf() ~= pre_open_buf
          then
            vim.api.nvim_set_current_buf(pre_open_buf)
          end
        end,
        desc = "Quit",
      },
    },
  },
})

-- Open file manager
vim.keymap.set("n", "<BS>", function()
  pre_open_buf = vim.api.nvim_get_current_buf()
  fyler.open()
end, { desc = "File Manager - Fyler" })
