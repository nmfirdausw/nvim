return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim"
	},
	opts = {
		defaults = {
			borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			sorting_strategy = "ascending",
			layout_strategy = "flex",
			prompt_prefix = " " .. require("icons").ui.Search .. " ",
			selection_caret = require("icons").ui.Selected .. " ",
			layout_config = {
				prompt_position = "top",
				preview_cutoff = 10,
				vertical = { mirror = true },
				flex = { flip_columns = 140 },
			},
			path_display = { "truncate " },
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
    opts.extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
			    layout_config = {
            width = function(_, max_columns, _)
              return math.min(max_columns, 120)
            end,
			    },
          borderchars = {
            prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          },
        }
      }
    }
		telescope.setup(opts)
		telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
	end,
}
