return {

	-- {
	-- 	"aktersnurra/no-clown-fiesta.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme no-clown-fiesta")
	-- 	end,
	-- },
	-- { "lvim-tech/lvim-colorscheme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme lvim")
	-- 	end,
	-- },
	-- {
	-- 	"crispybaccoon/evergarden",
	-- 	opts = {
	-- 		transparent_background = true,
	-- 		contrast_dark = "medium", -- 'hard'|'medium'|'soft'
	-- 		overrides = {}, -- add custom overrides
	-- 	},
	--
	-- 	config = function()
	-- 		vim.cmd("colorscheme evergarden")
	-- 	end,
	-- },
	-- {
	-- 	"sebasruiz09/fizz.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme fizz")
	-- 	end,
	-- },
	-- {
	--   'projekt0n/caret.nvim',
	--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   config = function()
	--     require('caret').setup({
	--       -- ...
	--     })
	--
	--     vim.cmd('colorscheme caret')
	--   end,
	-- },
	--  {
	--  	"chama-chomo/grail",
	--  	version = false,
	--  	lazy = false,
	--  	priority = 1000, -- make sure to load this before all the other start plugins
	--  	-- Optional; default configuration will be used if setup isn't called.
	--  	config = function()
	--    	require("grail").setup({
	--      	-- Your config here
	--    	})
	--  	end,
	-- },
	-- {
	--  	"xero/miasma.nvim",
	--  	lazy = false,
	--  	priority = 1000,
	--  	config = function()
	--    	vim.cmd("colorscheme miasma")
	--  	end,
	-- },
	-- {
	-- 	"antonio-hickey/minty-melon",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme minty-melon]])
	-- 	end,
	-- },
	-- {
	-- 	"antonio-hickey/citrus-mist",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme citrus-mist]])
	-- 	end,
	-- },
	{
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
	},
	-- {
	-- "neanias/everforest-nvim",
	--  	version = false,
	--  	lazy = false,
	--  	priority = 1000, -- make sure to load this before all the other start plugins
	--  	-- Optional; default configuration will be used if setup isn't called.
	--  	config = function()
	--    	require("everforest").setup({
	--      	-- Your config here
	--    	})
	--
	-- 		vim.cmd([[colorscheme everforest]])
	--  	end,
	-- }
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			compile = false, -- enable compiling the colorscheme
	-- 			undercurl = true, -- enable undercurls
	-- 			commentStyle = { italic = true },
	-- 			functionStyle = {},
	-- 			keywordStyle = { italic = true },
	-- 			statementStyle = { bold = true },
	-- 			typeStyle = {},
	-- 			transparent = false, -- do not set background color
	-- 			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	-- 			terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- 			colors = {         -- add/modify theme and palette colors
	-- 				palette = {},
	-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 			},
	-- 			theme = "wave", -- Load "wave" theme when 'background' option is not set
	-- 			background = { -- map the value of 'background' option to a theme
	-- 				dark = "wave", -- try "dragon" !
	-- 				light = "lotus",
	-- 			},
	--
	-- 			vim.cmd("colorscheme kanagawa"),
	-- 		})
	-- 	end,
	-- },
}
