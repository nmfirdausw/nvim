return {
  {
    "nmfirdausw/forest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme forest-night")
    end
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
    end
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme nord")
			vim.api.nvim_set_hl(0, "WinBar", { link = "Normal" })
			vim.api.nvim_set_hl(0, "WinBarNC", { link = "Normal" })
    end
  }
}
