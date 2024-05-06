return {
  "j-hui/fidget.nvim",
  events = "LspAttach",
  config = function()
    require("fidget").setup({
      notification = {
        poll_rate = 10,
        filter = vim.log.levels.INFO,
        history_size = 128,
        override_vim_notify = false,
        configs = { default = require("fidget.notification").default_config },
        redirect = function(msg, level, opts)
          if opts and opts.on_open then
            return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
          end
        end,

        view = {
          stack_upwards = true,
          icon_separator = " ",
          group_separator = "---",
          group_separator_hl = "Comment",
          render_message = function(msg, cnt)
            return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
          end,
        },
      },
      progress = {
        display = {
          done_icon = "󰸞",
        }
      }
    })
  end
}
