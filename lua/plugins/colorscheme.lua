return {
	-- "antonio-hickey/citrus-mist",
	-- version = false,
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd([[colorscheme citrus-mist]])
	-- end,
	--
	"Skullamortis/forest.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = false,
		style = "serene", -- The theme comes in three styles, `serene`, a darker variant `night` and `day`
		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = true },
			keywords = { italic = true },
			functions = { bold = true },
			variables = { italic = true },
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "normal", -- style for sidebars, see below
			floats = "transparent", -- style for floating windows
		},
	},
	config = function(_, opts)
		require("forest").setup(opts)
		vim.cmd([[colorscheme forest]])
	end,
}
