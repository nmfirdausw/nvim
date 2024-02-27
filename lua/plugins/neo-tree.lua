return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Open or focus File Explorer" },
		{ "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Toggle File Explorer" },
	},
	opts = {
		popup_border_style = "single",
		close_if_last_window = true,
		enable_git_status = true,
		enable_diagnostics = true,
		enable_normal_mode_for_inputs = false,
		sources = { "filesystem", "buffers", "git_status" },
		source_selector = {
			winbar = true,
			content_layout = "center",
			sources = {
				{ source = "filesystem", display_name = "Files" },
				{ source = "buffers", display_name = "Buferss" },
				{ source = "git_status", display_name = "Git" },
				{ source = "diagnostics", display_name = "Diagnostic" },
			},
		},
		default_component_configs = {
			container = {
				enable_character_fade = false,
			},
			indent = {
				indent_size = 2,
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
		commands = {
			parent_or_close = function(state)
				local node = state.tree:get_node()
				if (node.type == "directory" or node:has_children()) and node:is_expanded() then
					state.commands.toggle_node(state)
				else
					require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
				end
			end,
			child_or_open = function(state)
				local node = state.tree:get_node()
				if node.type == "directory" or node:has_children() then
					if not node:is_expanded() then -- if unexpanded, expand
						state.commands.toggle_node(state)
					else -- if expanded and has children, seleect the next child
						require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
					end
				else -- if not a directory just open it
					state.commands.open(state)
				end
			end,
		},
		window = {
			width = 40,
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
        ["L"] = "next_source",
				h = "parent_or_close",
				l = "child_or_open",
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
