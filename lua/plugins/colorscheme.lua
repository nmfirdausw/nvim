return {
	"Skullamortis/forest.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = false,
		style = "serene",
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = true },
			variables = { italic = true },
			sidebars = "normal",
			floats = "transparent",
		},
	},
	config = function(_, opts)
		require("forest").setup(opts)
		vim.cmd([[colorscheme forest]])
	end,
}
