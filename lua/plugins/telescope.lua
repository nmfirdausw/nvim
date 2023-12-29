return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>,",  "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                               desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>",                                desc = "Find Git Files" },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      { desc = "Fuzzy find recent files" },
    },
    {
      "<leader>fw",
      "<cmd>Telescope live_grep<cr>",
      { desc = "Find string in cwd" },
    },
    {
      "<leader>fs",
      "<cmd>Telescope grep_string<cr>",
      { desc = "Find string under cursor in cwd" },
    },
  },
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      sorting_strategy = "ascending",
      layout_strategy = "flex",
      prompt_prefix = " ",
      selection_caret = " ",
      layout_config = {
        prompt_position = "top",
        vertical = { mirror = true },
        flex = { flip_columns = 140 },
      },
      path_display = { "truncate " },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}
