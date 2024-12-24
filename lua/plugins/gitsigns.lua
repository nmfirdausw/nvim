return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  cond = vim.g.gitdir,
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
      untracked = { text = "+" },
    },
    signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "-" },
      changedelete = { text = "~" },
    },
    on_attach = function(buffer)
      local util = require("util")
      local keymaps = require("config.keymaps").git
      for _, keymap in ipairs(keymaps) do
        keymap[3].buffer = buffer
        util.set_keymap(keymap)
      end
    end,
  },
}
