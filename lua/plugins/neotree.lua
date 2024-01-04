local icons = require("icons")

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v3.x",
	keys = {
		{ "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Open or focus File Explorer" },
		{ "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" },
	},
	opts = {
		popup_border_style = "single",
		close_if_last_window = true,
		enable_git_status = true,
		enable_diagnostics = true,
		enable_normal_mode_for_inputs = true,
		default_component_configs = {
			container = {
				enable_character_fade = false,
			},
			indent = {
				padding = 0,
			},
			modified = {
				symbol = icons.ui.FileModified,
			},
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = icons.git.Deleted,
					renamed = icons.git.Renamed,
					untracked = icons.git.Untracked,
					ignored = icons.git.Ignored,
					unstaged = "",
					staged = icons.git.Staged,
					conflict = icons.git.Conflicted,
				},
			},
		},
		window = {
			width = 30,
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree").close_all()
				end,
			},
		},
	},
}
