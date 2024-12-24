return {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  config = function()
    local status = require("util.status")
    require("heirline").setup({
      statusline = {
        status.Space,
        status.ViMode,
        status.Space,
        status.Space,
        status.Space,
        status.GitBranch,
        status.Path,
        status.Space,
        status.FileIcon,
        status.Space,
        status.FileName,
        status.Space,
        status.FileFlags,
        status.Space,
        status.GitStatus,
        status.Align,
        status.Diagnostics,
        status.Space,
        status.LSPActive,
        status.Space,
        status.Space,
        status.Ruler,
      },
    })
  end,
}
