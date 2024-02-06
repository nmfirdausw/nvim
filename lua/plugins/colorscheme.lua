return {
  {
    "nmfirdausw/forest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme forest-night")
    end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = true,
        overrides = {},
      })
      -- vim.cmd("colorscheme ayu")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nord")
      vim.api.nvim_set_hl(0, "WinBar", { link = "Normal" })
      vim.api.nvim_set_hl(0, "WinBarNC", { link = "Normal" })
      vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#2e3340" })
      vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = "#2e3340", fg = "#81a1c1" })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorActive", { bg = "#2e3340", fg = "#2e3340" })
      vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { bg = "#2e3340", fg = "#2e3340" })
    end,
  },
}
