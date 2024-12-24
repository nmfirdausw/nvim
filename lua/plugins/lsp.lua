return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePost" },
    opts = function()
      return {
        diagnostics = {
          underline = true,
          update_in_insert = true,
          virtual_text = {
            spacing = 4,
            source = "if_many",
          },
        },
        servers = {
          emmet_ls = {
            filetypes = {
              "blade",
              "css",
              "html",
              "sass",
              "scss",
            },
          },
          intelephense = {
            filetypes = { "php", "blade", "php_only" },
            settings = {
              intelephense = {
                filetypes = { "php", "blade", "php_only" },
                files = {
                  associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                  maxSize = 5000000,
                },
              },
            },
          },
          tailwindcss = {
            settings = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    "@?class\\(([^]*)\\)",
                    "'([^']*)'",
                  },
                },
              },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local util = require("util")
      local lspconfig = require("lspconfig")
      local blink = require("blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )
      local handlers = {
        function(server)
          lspconfig[server].setup({
            capabilities = capabilities,
          })
        end,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          vim.lsp.inlay_hint.enable()
          local keymaps = require("config.keymaps").lsp
          for _, keymap in ipairs(keymaps) do
            keymap[3].method = nil
            keymap[3].buffer = event.buf
            util.set_keymap(keymap)
          end
        end,
      })

      for server, server_opts in pairs(opts.servers) do
        server_opts = vim.tbl_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, server_opts)
        handlers[server] = function()
          lspconfig[server].setup(server_opts)
        end
      end

      require("mason-lspconfig").setup_handlers(handlers)

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "●",
            [vim.diagnostic.severity.WARN] = "●",
            [vim.diagnostic.severity.HINT] = "●",
            [vim.diagnostic.severity.INFO] = "●",
          },
        },
        underline = true,
        update_in_insert = true,
        severity_sort = true,
      })

      local diagnostics_virtual_text = {
        Error = "•",
        Warn = "•",
        Hint = "•",
        Info = "•",
      }

      opts.diagnostics.virtual_text.prefix = function(diagnostic)
        for d, icon in pairs(diagnostics_virtual_text) do
          if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
            return icon
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
  },
}
