return {
  "saghen/blink.cmp",
  event = { "VeryLazy" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "L3MON4D3/LuaSnip",
      version = false,
      event = "VeryLazy",
      build = "make install_jsregexp",
    },
  },
  version = "*",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
      kind_icons = {
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lsp = { fallbacks = { "lazydev" } },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
      },
    },
    signature = { enabled = true },
    completion = {
      menu = {
        enabled = true,
        min_width = 30,
        border = "single",
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                if require("blink.cmp.completion.windows.render.tailwind").get_hex_color(ctx.item) then
                  return "󰝤"
                end
                return ctx.kind_icon .. ctx.icon_gap
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "single",
        },
      },
      ghost_text = {
        enabled = true,
      },
      trigger = {
        show_on_accept_on_trigger_character = false,
      },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      list = {
        selection = "manual",
      },
    },
  },
  -- opts_extend = { "sources.default" },
}
