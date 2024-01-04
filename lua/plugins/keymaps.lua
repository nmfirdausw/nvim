return {
 {
    "mrjones2014/legendary.nvim", -- A command palette for keymaps, commands and autocmds
    priority = 10000,
    lazy = false, -- Never lazy load this
    dependencies = {
      "kkharji/sqlite.lua",
      "folke/which-key.nvim",
    },
    init = function()
      require("legendary").keymaps({
        {
          "<leader><leader>",
          require("legendary").find,
          hide = true,
          description = "Open Legendary",
          mode = { "n", "v" },
        },
      })
    end,
    config = function()
      require("legendary").setup({
        select_prompt = "Legendary",
        include_builtin = true,
        extensions = {
          lazy_nvim = true,
          which_key = false,
          smart_splits = {
            directions = { 'h', 'j', 'k', 'l' },
            mods = {
              move = '<C>',
              resize = '<M>',
              swap = false
            },
          },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      window = {
        border = "single",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
      require("which-key").register {
        ["<leader>b"] = { name = " Buffer", _ = "which_key_ignore" },
        ["<leader>s"] = { name = " Search", _ = "which_key_ignore" },
        ["<leader>d"] = { name = " Diagnostics", _ = "which_key_ignore" },
        ["<leader>l"] = { name = " LSP", _ = "which_key_ignore" },
        ["<leader>x"] = { name = " Trouble", _ = "which_key_ignore" },
      }
    end
  }
}
