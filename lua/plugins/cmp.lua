return {
  "nmfirdausw/nvim-cmp",
  event = { "InsertEnter", "CmdlineChanged" },
  dependencies = {
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "onsails/lspkind.nvim" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local lspkind = require("lspkind")

    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "buffer" },
      },
      preselect = cmp.PreselectMode.None,
      experimental = {
        ghost_text = true,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "none",
          winhighlight = "Normal:Pmenu",
          side_padding = 0,
          col_offset = -3,
        }),
        documentation = cmp.config.window.bordered({
          border = { "", "", "", " ","", "", "", " ", },
          winhighlight = "Normal:Pmenu",
        }),
      },
      formatting = {
        fields = { "kind", "abbr"},
        format = function(entry, vim_item)
          local kind = lspkind.cmp_format({
            mode = "symbol_text"
          })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          return kind
        end,
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
      sources = cmp.config.sources(
        {{ name = "git" }},
        {{ name = "buffer" }}
      ),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        {{ name = "path" }},
        {{ name = "cmdline" }}
      ),
    })
  end
}
