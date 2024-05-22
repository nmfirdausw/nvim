return {
  "folke/which-key.nvim",
  event = "UiEnter",
  config = function()
    require("which-key").setup({
      icons = {
        group = "",
        separator = "",
      },
      window = {
        border = "single",
      },
      disable = {
        filetypes = {
          "TelescopePrompt"
        }
      },
    })
    require("which-key").register({
      ["<leader>e"] = { name = " Explorer", _ = "which_key_ignore" },
      ["<leader>l"] = { name = " LSP", _ = "which_key_ignore" },
      ["<leader>s"] = { name = " Splits", _ = "which_key_ignore" },
      ["<leader>f"] = { name = " Find", _ = "which_key_ignore" },
      ["<leader>u"] = { name = " UI/UX", _ = "which_key_ignore" },
      ["<leader>x"] = { name = "󱠪 Trouble", _ = "which_key_ignore" },
    })
    if vim.g.gitdir then
      require("which-key").register({
        ["<leader>g"] = { name = "󰊢 Git", _ = "which_key_ignore" },
        ["<leader>t"] = { name = " Terminal", _ = "which_key_ignore" },
        ["<leader>gf"] = { name = " Find", _ = "which_key_ignore" },
        ["<leader>fi"] = { name = " Include ignored files", _ = "which_key_ignore" },
      })
    end
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { link = "NormalFloat" })
  end,
}
