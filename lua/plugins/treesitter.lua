return {
	{
	 	"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },
		lazy = vim.fn.argc(-1) == 0,
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = {
					custom_calculation = function(_, language_tree)
						if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" and language_tree._lang ~= "php" then
							return "{{-- %s --}}"
						end
					end,
				},
			},
    	"nvim-treesitter/nvim-treesitter-textobjects",
		},
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<C-s>", desc = "Init selection" },
			{ "<C-i>", desc = "Increment selection" },
			{ "<C-d>", desc = "Decrement selection", mode = "x" },
		},
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "php", "json" },
			},
			indent = { enable = false },
			auto_install = true,
			ensure_installed = {
				"bash",
				"blade",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"php_only",
				"phpdoc",
				"vim",
				"vimdoc",
        "query",
        "regex",
        "yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-i>",
					node_incremental = "<C-i>",
					scope_incremental = false,
					node_decremental = "<C-d>",
				},
			},
		},
		config = function(_, opts)
			---@class ParserInfo[]
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = {
						"src/parser.c",
						-- 'src/scanner.cc',
					},
					branch = "main",
					generate_requires_npm = true,
					requires_generate_from_grammar = true,
				},
				filetype = "blade",
			}

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
