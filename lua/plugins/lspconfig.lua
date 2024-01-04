return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "folke/neodev.nvim",
      config = function()
        require('neodev').setup()
      end
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

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = border
      }
    )

    vim.diagnostic.config {
      float = {
        border = border
      }
    }

    require('lspconfig.ui.windows').default_options = {
      border = border
    }

    local icons = require("icons")

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })

    local signs = {
      Error = icons.diagnostics.Error,
      Warn = icons.diagnostics.Warning,
      Hint = icons.diagnostics.Hint,
      Info = icons.diagnostics.Information,
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Server Setup
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    })

    lspconfig.intelephense.setup({
      capabilities = capabilities,
      filetypes = { "php", "blade" },
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
}
