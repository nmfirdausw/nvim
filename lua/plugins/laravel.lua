return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    keys = function()
      return require("config.keymaps").laravel
    end,
    event = { "VeryLazy" },
    cond = function()
      local cwd = vim.fn.getcwd()
      local composer_file = cwd .. "/composer.json"
      local artisan_file = cwd .. "/artisan"

      return vim.fn.filereadable(composer_file) == 1 and vim.fn.executable(artisan_file) == 1
    end,
    opts = {
      lsp_server = "intelephense",
      features = { null_ls = { enable = true } },
    },
    config = true,
  },
  {
    "ricardoramirezr/blade-nav.nvim",
    ft = { "blade", "php" },
  }
}
