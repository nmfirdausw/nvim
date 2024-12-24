return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "VeryLazy" },
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    event = { "VeryLazy" },
    opts = {
      symbol = "▏",
      draw = {
        delay = 0,
      },
    },
  },
  {
    "nmac427/guess-indent.nvim",
    cmd = "GuessIndent",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {},
  },
}
