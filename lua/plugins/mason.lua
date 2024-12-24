return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "single",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "LspInstall", "LspUninstall" },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        -- lsp
        "biome",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "intelephense",
        "json-lsp",
        "lua_ls",
        "nginx-language-server",
        "python-lsp-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        "emmet-ls",
        "html-lsp",
        -- linter
        "tlint",
        "hadolint",
        "phpstan",
        "phpcs",
        -- formatter
        "blade-formatter",
        "pint",
        "shfmt",
        "stylua",
        "yamlfmt",
        "php-cs-fixer",
        --dap
        "php-debug-adapter",
      },
      auto_update = true,
    },
  },
}
