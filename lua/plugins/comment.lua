return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
  },
  keys = {
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
  },
  config = function ()
    local commentstring = require("ts_context_commentstring.integrations.comment_nvim")
    require("Comment").setup({
      pre_hook = commentstring.create_pre_hook()
    })

    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
    end, { desc = "Toggle line comment" })
    vim.keymap.set(
      "v",
      "<leader>/",
      "<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle line comment for selection" }
    )
    vim.keymap.set(
      "v",
      "<leader>?",
      "<Esc><Cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
      { desc = "Toggle block comment for selection" }
    )
  end,
}
