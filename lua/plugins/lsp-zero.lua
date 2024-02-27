return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "single",
        }
      })
    end
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      { "lvimuser/lsp-inlayhints.nvim" },
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
      vim.g.lsp_zero_ui_float_border = "single"

      local lsp_zero = require("lsp-zero")
      local border = "single"
      local lspconfig = require('lspconfig')
      local inlayhints = require('lsp-inlayhints')

      inlayhints.setup()

      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      lsp_zero.set_sign_icons({
        error = "●",
        warn = "●",
        hint = "●",
        info = "●"
      })

      lsp_zero.set_server_config({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      })

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

      require("mason-lspconfig").setup({
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
        handlers = {
          lsp_zero.default_setup,

          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
          intelephense = function()

            lspconfig.intelephense.setup({
              on_attach = function(client, bufnr)
                inlayhints.on_attach(client, bufnr)
              end,
              filetypes = { "php" },
            })
          end,
          tailwindcss = function()
            lspconfig.tailwindcss.setup({
              filetypes = { "html", "blade", "css" },
            })
          end,
          emmet_ls = function()
            lspconfig.emmet_ls.setup({
              filetypes = { "html" },
            })
          end,
          cssls = function()
            lspconfig.cssls.setup({
              settings = {
                css = {
                  validate = true,
                  lint = {
                    unknownAtRules = "ignore",
                  },
                },
              },
            })
          end,
          html = function()
            lspconfig.html.setup({
              filetypes = { "html", "blade" },
            })
          end
        }
      })
    end
  }
}
