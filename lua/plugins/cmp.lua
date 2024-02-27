  return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
		  { "hrsh7th/cmp-path" },
		  { "L3MON4D3/LuaSnip" },
		  { "hrsh7th/cmp-buffer" },
		  { "hrsh7th/cmp-cmdline" },
		  { "onsails/lspkind.nvim" },
		  { "saadparwaiz1/cmp_luasnip" },
		  { "rafamadriz/friendly-snippets" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
		  local lspkind = require("lspkind")
		  local border_opts = { border = "single" }

      lsp_zero.extend_cmp()

      local cmp = require("cmp")
      local cmp_action = lsp_zero.cmp_action()

		  require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'buffer', keyword_length = 3 },
        },
			  preselect = cmp.PreselectMode.None,
        experimental = {
          ghost_text = true,
        },
			  window = {
				  completion = cmp.config.window.bordered(border_opts),
				  documentation = cmp.config.window.bordered(border_opts),
			  },
			  formatting = {
				  format = lspkind.cmp_format({
					  mode = "symbol_text", -- options: "text", "text_symbol", "symbol_text", "symbol"
					  maxwidth = 50,
					  ellipsis_char = "...",
					  menu = {
						  nvim_lsp = "[LSP]",
						  path = "[Path]",
						  buffer = "[Buffer]",
						  luasnip = "[LuaSnip]",
					  },
					  before = function(entry, vim_item) -- for tailwind css autocomplete
						  if vim_item.kind == "Color" and entry.completion_item.documentation then
							  local _, _, r, g, b =
									  string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
							  if r then
								  local color = string.format("%02x", r)
										  .. string.format("%02x", g)
										  .. string.format("%02x", b)
								  print(color)
								  local group = "Tw_" .. color
								  if vim.fn.hlID(group) < 1 then
									  vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
								  end
								  vim_item.kind = "■" -- or "⬤" or anything
								  vim_item.kind_hl_group = group
								  return vim_item
							  end
						  end
						  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind)
								  or vim_item.kind
						  return vim_item
					  end,
				  }),
			  },
        mapping = cmp.mapping.preset.insert({
          ["<S-Tab>"] = cmp.mapping.complete(),
				  ["<C-p>"] = cmp.mapping.select_prev_item(),
				  ["<C-n>"] = cmp.mapping.select_next_item(),
				  ["<C-k>"] = cmp.mapping.scroll_docs(-4),
				  ["<C-j>"] = cmp.mapping.scroll_docs(4),
				  ["<C-l>"] = cmp.mapping.complete(),
				  ["<C-e>"] = cmp.mapping.abort(),
				  ["<CR>"] = cmp.mapping.confirm({ select = false }),
        })
      })

      cmp.setup.filetype("gitcommit", {
			  sources = cmp.config.sources({
				  { name = "git" },
			  }, {
				  { name = "buffer" },
			  }),
		  })

		  cmp.setup.cmdline({ "/", "?" }, {
			  mapping = cmp.mapping.preset.cmdline(),
			  sources = {
				  { name = "buffer" },
			  },
		  })

		  cmp.setup.cmdline(":", {
			  mapping = cmp.mapping.preset.cmdline(),
			  sources = cmp.config.sources({
				  { name = "path" },
			  }, {
				  { name = "cmdline" },
			  }),
		  })
    end
  }

