return {
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
    require("which-key").register({
      ["<leader>b"] = { name = " Buffer", _ = "which_key_ignore" },
      ["<leader>s"] = { name = " Search", _ = "which_key_ignore" },
      ["<leader>d"] = { name = " Diagnostics", _ = "which_key_ignore" },
      ["<leader>l"] = { name = " LSP", _ = "which_key_ignore" },
      ["<leader>x"] = { name = " Trouble", _ = "which_key_ignore" },
      ["<leader>t"] = { name = " Toggle", _ = "which_key_ignore" },
    })
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "NormalFloat" })
  end,
}
