return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			signs = {
				-- add = { text = "│" },
				-- change = { text = "│" },
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				-- untracked = { text = "│" },
				untracked = { text = "+" },
			},
			numhl = false,
			signcolumn = true,
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				require("legendary").keymaps({
					{ "]h",
						gs.next_hunk,
						description = "Next Hunk",
						opts = { buffer = buffer },
					},
					{ "[h",
						gs.prev_hunk,
						description = "Previous Hunk",
						opts = { buffer = buffer },
					},
					{ "<leader>gn",
						gs.next_hunk,
						description = "Next Hunk",
						opts = { buffer = buffer },
					},
					{ "<leader>gp",
						gs.prev_hunk,
						description = "Previous Hunk",
						opts = { buffer = buffer },
					},
					{
						"<leader>gs",
						gs.undo_stage_hunk,
						description = "Undo Stage Hunk",
						opts = { buffer = buffer },
					},
					{
						"<leader>gr",
						":Gitsigns reset_hunk<CR>",
						mode = { "n", "v" },
						description = "Reset Hunk",
						opts = { buffer = buffer },
					},
					{ "<leader>gS",
						gs.stage_buffer,
						description = "Stage Buffer",
						opts = { buffer = buffer },
					},
					{
						"<leader>gu",
						gs.undo_stage_hunk,
						description = "Undo Stage Hunk",
						opts = { buffer = buffer },
					},
					{
						"<leader>gR",
						gs.reset_buffer,
						description = "Reset Buffer",
						opts = { buffer = buffer },
					},
					{
						"<leader>gp",
						gs.preview_hunk,
						description = "Preview Hunk",
						opts = { buffer = buffer },
					},
					{
						"<leader>gb",
						function()
							gs.blame_line({ full = true })
						end,
						description = "Blame Line",
						opts = { buffer = buffer },
					},
					{
						"ih",
						":<C-U>Gitsigns select_hunk<CR>",
						mode = { "o", "x" },
						description = "GitSigns Select Hunk",
						opts = { buffer = buffer },
					},
					{
						"<space>gd",
						":<C-U>DiffviewToggle<CR>",
						description = "Toggle diff view",
						opts = {},
					}
				})
			end,
		},
	},
	{
		"benwilliams140/diffview.nvim",
		branch = "feat-diffview-toggle",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
			require("diffview").setup({
			})
		end
	},
}
