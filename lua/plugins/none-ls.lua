return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufWritePost" },
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.root_dir = opts.root_dir
          or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.pint.with({
          extra_filetypes = { "blade" },
        }),
        nls.builtins.formatting.blade_formatter,
        nls.builtins.diagnostics.phpstan.with({
          extra_args = {
            "--memory-limit=2G",
          },
        }),
      })
    end,
  },
  {
    "zeioth/none-ls-autoload.nvim",
    event = "BufEnter",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    opts = {
      methods = {
        diagnostics = true,
        formatting = true,
        code_actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
