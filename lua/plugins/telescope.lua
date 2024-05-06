return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = function()
    local keys = {
      { "<C-f>", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false, borderchars = { prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' }, results = { '─', '│', '─', '│', '├', '┤', '┘', '└' }, }}))<cr>", desc = "Find files", silent = true },
      { "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", desc = "Files", silent = true },
      { "<leader>fr", ":lua require('telescope.builtin').oldfiles()<cr>", desc = "Recent files", silent = true },
      { "<leader>fR", ":lua require('telescope.builtin').resume()<cr>", desc = "Recent files", silent = true },
      { "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", desc = "Buffers", silent = true },
      { "<leader>fw", ":lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Word [buffer]", silent = true },
      { "<leader>fW", ":lua require('telescope.builtin').live_grep()<cr>", desc = "Word [CWD]", silent = true },
      { "<leader>ft", ":lua require('telescope.builtin').builtin()<cr>", desc = "Telescope", silent = true },
      { "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", desc = "Help", silent = true },
      { "<leader>fH", ":lua require('telescope.builtin').highlights()<cr>", desc = "Highlights", silent = true },
      { "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>", desc = "Keymaps", silent = true },
      { "<leader>fc", ":lua require('telescope.builtin').commands()<cr>", desc = "Commands", silent = true },
      { "<leader>fj", ":lua require('telescope.builtin').jumplist()<cr>", desc = "Jump list", silent = true },
      { "<leader>fm", ":lua require('telescope.builtin').marks()<cr>", desc = "Marks", silent = true },
      { "<leader>f/", ":lua require('telescope.builtin').search_history()<cr>", desc = "Search history", silent = true },
      { "<leader>fs", ":lua require('telescope.builtin').spell_suggest()<cr>", desc = "Spell suggestions", silent = true },
      { "<leader>fo", ":lua require('telescope.builtin').vim_options()<cr>", desc = "Vim options", silent = true },
    }
    if vim.g.gitdir then
      table.insert(keys, { "<leader>fif", ":lua require('telescope.builtin').find_files({ no_ignore = true })<cr>", desc = "Files", silent = true })
      table.insert(keys, { "<leader>fiw", ":lua require('telescope.builtin').live_grep({ additional_args = { '--no-ignore' } })<cr>", desc = "Word", silent = true })
      table.insert(keys, { "<leader>gff", ":lua require('telescope.builtin').git_files()<cr>", desc = "Files", silent = true })
      table.insert(keys, { "<leader>gfs", ":lua require('telescope.builtin').git_status()<cr>", desc = "Status", silent = true })
      table.insert(keys, { "<leader>gfS", ":lua require('telescope.builtin').git_stash()<cr>", desc = "Status", silent = true })
      table.insert(keys, { "<leader>gfC", ":lua require('telescope.builtin').git_commits()<cr>", desc = "Commits", silent = true })
      table.insert(keys, { "<leader>gfc", ":lua require('telescope.builtin').git_bcommits()<cr>", desc = "Commits [buffer]", silent = true })
      table.insert(keys, { "<leader>gfr", ":lua require('telescope.builtin').git_bcommits_range()<cr>", desc = "Commits range [buffer]", silent = true })
      table.insert(keys, { "<leader>gfb", ":lua require('telescope.builtin').git_branches()<cr>", desc = "Branches", silent = true })
    end
    return keys
  end,
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  opts = {
    defaults = {
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      sorting_strategy = "ascending",
      layout_strategy = "flex",
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = " ",
      layout_config = {
        width = 0.95,
        height = 0.90,
        prompt_position = "top",
        preview_cutoff = 10,
        vertical = { mirror = true },
        flex = { flip_columns = 140 },
      },
      path_display = { "truncate " },
    },
    themes = {
      dropdown = {
        borderchars = {
          { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
        }
      }
    }
  },
  config = function(_, opts)
    local telescope = require("telescope")
    opts.extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          borderchars = {
            prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          },
        }),
      },
    }
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}

