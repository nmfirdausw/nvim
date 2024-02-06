return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "folke/neodev.nvim",
        config = function()
          require("neodev").setup()
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "lua_ls",
            "intelephense",
            "html",
            "emmet_ls",
            "cssls",
            "tailwindcss",
            "tsserver",
          },
          automatic_installation = true,
        },
        config = function(_, opts)
          require("mason-lspconfig").setup(opts)
        end,
      },
      {
        "ray-x/lsp_signature.nvim",
        opts = {
          bind = true,
          handler_opts = {
            border = "single",
          },
        },
        config = function(_, opts)
          require("lsp_signature").setup(opts)
        end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local border = "single"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
      })

      vim.diagnostic.config({
        float = {
          border = border,
        },
      })

      require("lspconfig.ui.windows").default_options = {
        border = border,
      }

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "●",
            [vim.diagnostic.severity.WARN] = "●",
            [vim.diagnostic.severity.HINT] = "●",
            [vim.diagnostic.severity.INFO] = "●",
          },
        },
      })

      -- Server Setup
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      })

      lspconfig.intelephense.setup({
        capabilities = capabilities,
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "php", "blade", "css" },
      })

      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "html", "cssls", "php", "blade" },
      })

      lspconfig.cssls.setup({
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
        capabilities = capabilities,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "php", "blade" },
      })

      lspconfig.tsserver.setup({
        capabilites = capabilities,
      })
      -- End Server Setup
    end,
  },
}
