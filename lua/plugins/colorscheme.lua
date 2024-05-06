return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local palette = require("gruvbox").palette
    local float = "#181817"
    local line = "#393a39"
    local normal = "#2a2b2a"
    local normal_dark = "#2f2f2e"

    require("gruvbox").setup({
      overrides = {
        Normal = { bg = normal },
        NormalNC = { bg = line },
        NormalFloat = { bg = float },
        CursorLineNr = { bg = line },
        CursorLineSign = { bg = line },
        SignColumn = { bg = normal },
        ColorColumn = { bg = line },
        WinBar = { bg = normal },
        WinBarNC = { bg = line },
        Pmenu = { bg = float },
        PmenuSbar = { bg = float },
        PmenuThumb = { bg = normal_dark },
        TreesitterContext = { bg = line },
        TreesitterContextLineNumber = { bg = line, fg = palette.dark4, },
        DiagnosticOk = { fg = palette.bright_green },
        DiagnosticSignHint = { fg = palette.bright_aqua },
        DiagnosticSignInfo = { fg = palette.bright_blue },
        DiagnosticSignWarn = { fg = palette.bright_yellow },
        DiagnosticSignError = { fg = palette.bright_red },
        TelescopeSelection = { bg = line, fg = palette.bright_orange, bold = true },
        CursorLine = { bg = line },
        FloatBorder = { fg = palette.bright_green, bg = float },
        MatchParen = { italic = true, bold = true, bg = palette.dark0_hard },
      }
    })
    vim.cmd.colorscheme("gruvbox")

    vim.api.nvim_set_hl(0, "FoldColumn", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "CursorLineFold", { link = "CursorLineNr" })
    vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "VertSplit", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "WinSeparator", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceCmdPopupTitle", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { link = "FloatBorder" })
  end
}
