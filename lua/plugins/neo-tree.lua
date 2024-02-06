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
		enable_diagnostics = false,
		enable_normal_mode_for_inputs = false,
		default_component_configs = {
			container = {
				enable_character_fade = false,
			},
			indent = {
				padding = 0,
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "",
			},
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "",
					renamed = "",
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "󰱒",
					conflict = "󱋯",
				},
			},
		},
		window = {
			width = 30,
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push"
			}
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
