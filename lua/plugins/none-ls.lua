return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.pint,
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.formatting.prettier,
      },
    })
  end,
}
