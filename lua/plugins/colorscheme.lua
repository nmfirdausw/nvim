return {
  "nmfirdausw/yugen.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    local colors = {
      placeholder = "#303030",
      color100 = "#fafafa",
      color200 = "#D4D4D4",
      color300 = "#A9A9A9",
      color400 = "#696969",
      color500 = "#505050",
      color600 = "#303030",
      color700 = "#151515",
      color800 = "#000000",
      primary = "#FFBE89",
      success = "#7EAB8E",
      warning = "#FFF2AF",
      error = "#F57A7A",
      none = "none",
    }
    vim.cmd.colorscheme("yugen")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.success, bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.success, bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.color400, bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = colors.color400, bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "Structure", { fg = colors.color400, bg = "none" })
    vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.primary, bg = "none" })
    vim.api.nvim_set_hl(0, "phpRegion", { fg = colors.primary, bg = "none" })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.color400, bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.warning, bg = "none" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.error, bg = "none" })
    vim.api.nvim_set_hl(0, "IblIndent", { fg = colors.color700, bg = "none" })
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = colors.color600, bg = "none" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.color500 })
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderInfo", { link = "NonText" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderWarn", { link = "NonText" })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderError", { link = "NonText" })
  end,
}
