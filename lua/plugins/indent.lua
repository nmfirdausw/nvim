return {
	{
		"nmac427/guess-indent.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		main = "ibl",
		dependencies = "HiPhish/rainbow-delimiters.nvim",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { link = "RainbowDelmiterRed" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { link = "RainbowDelimiterYellow"})
				vim.api.nvim_set_hl(0, "RainbowBlue", { link = "RainbowDelimiterBlue" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { link = "RainbowDelimiterOrange" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { link = "RainbowDelimiterGreen" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { link = "RainbowDelimiterViolet" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { link = "RainbowDelimiterCyan" })
			end)
			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({
				scope = { highlight = highlight },
				indent = {
					char = "▏",
					tab_char = "▏",
				},
			})
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			draw = {
				delay = 1,
			},
			symbol = "▏",
			-- symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
