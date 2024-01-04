-- Indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

require("legendary").keymaps({
	-- Buffers
	{
		"<S-h>",
		"<cmd>bprevious<cr>",
		description = "Previous buffer",
	},
	{
		"<S-l>",
		"<cmd>bnext<cr>",
		description = "Next buffer",
	},
	{
		"<leader>bp",
		"<cmd>bprevious<cr>",
		description = "Previous buffer",
	},
	{
		"<leader>bn",
		"<cmd>bnext<cr>",
		description = "Next buffer",
	},
	{
		"[b",
		"<cmd>bprevious<cr>",
		description = "Previous buffer",
	},
	{
		"]b",
		"<cmd>bnext<cr>",
		description = "Next buffer",
	},
	{
		"<leader>bb",
		"<cmd>e #<cr>",
		description = "Alternate buffer",
	},

	{
		"<S-j>",
		":m '>+1<cr>gv=gv",
		mode = "v",
		desc = "Move line down",
	},
	{
		"<S-k>",
		":m '<-2<cr>gv=gv",
		mode = "v",
		desc = "Move line up",
	},
	-- Comment
	{
		"<leader>/",
		function()
			require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
		end,
		mode = "n",
		desc = "Toggle line comment",
	},
	{
		"<leader>/",
		"<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		mode = "v",
		desc = "Toggle line comment for selection",
	},
	{
		"<leader>?",
		"<Esc><Cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
		mode = "v",
		desc = "Toggle block comment for selection",
	},
})
-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }

		require("legendary").keymaps({
			{
				"<leader>df",
				vim.diagnostic.open_float,
				description = "Diagnostic float",
			},
			{
				"[d",
				vim.diagnostic.goto_prev,
				description = "Previous diagnostic",
			},
			{
				"<leader>dp",
				vim.diagnostic.goto_prev,
				description = "Previous diagnostic",
			},
			{
				"]d",
				vim.diagnostic.goto_next,
				description = "Next diagnostic",
			},
			{
				"<leader>dn",
				vim.diagnostic.goto_next,
				description = "Next diagnostic",
			},
			{
				"<leader>lD",
				vim.lsp.buf.declaration,
				description = "Go to decalration",
				opts = opts,
			},
			{
				"<leader>ld",
				vim.lsp.buf.definition,
				description = "Go to definition",
				opts = opts,
			},
			{
				"<leader>li",
				vim.lsp.buf.implementation,
				description = "Go to implementation",
				opts = opts,
			},
			{
				"<leader>ls",
				vim.lsp.buf.signature_help,
				description = "View signature help",
				opts = opts,
			},
			{
				"<leader>lt",
				"<cmd>telescope lsp_type_definitions<cr>",
				description = "Show LSP type definitions",
				opts = opts,
			},
			{
				"<leader>lr",
				vim.lsp.buf.rename,
				description = "Smart rename",
				opts = opts,
			},
			{
				"<leader>la",
				vim.lsp.buf.code_action,
				description = "See available code actions",
				opts = opts,
			},
			{
				"<leader>lR",
				"<cmd>telescope lsp_references<cr>",
				description = "Show LSP references",
				opts = opts,
			},
			{
				"<leader>dl",
				"<cmd>TroubleToggle document_diagnostics<cr>",
				description = "Document diagnostics list (Trouble)",
				opts = opts,
			},
			{
				"<leader>dL",
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				description = "Workspace diagnostics list (Trouble)",
				opts = opts,
			},
			{
				"<leader>xd",
				"<cmd>TroubleToggle document_diagnostics<cr>",
				description = "Document diagnostics list",
				opts = opts,
			},
			{
				"<leader>xD",
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				description = "Workspace diagnostics list (Trouble)",
				opts = opts,
			},
			{
				"<leader>xr",
				"<cmd>TroubleToggle lsp_referencef<cr>",
				description = "LSP references list",
				opts = opts,
			},
			{
				"<leader>sd",
				"<cmd>telescope diagnostics<cr>",
				description = "Search for diagnostics",
				opts = opts,
			},
			{
				"<leader>lf",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				description = "Format code",
				opts = opts,
			},
		})

		require("which-key").register({
			["<leader>d"] = { name = " diagnostics", _ = "which_key_ignore" },
		})
	end,
})

-- Telescope
local builtin = require("telescope.builtin")
local function telescope_live_grep_current_buffer()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Current Buffer",
	})
end

require("legendary").keymaps({
	{
		"<leader>sq",
		builtin.oldfiles,
		description = "Search for recently opened files",
	},
	{
		"<leader>sb",
		builtin.buffers,
		description = "Search for buffers",
	},
	{
		"<leader>ss",
		function()
			builtin.current_buffer_fuzzy_find()
		end,
		description = "String in current buffer (Fuzzy)",
	},
	{
		"<leader>sS",
		telescope_live_grep_current_buffer,
		description = "String in current buffer (Grep)",
	},
	{
		"<leader>st",
		builtin.builtin,
		description = "Open Telescope",
	},
	{
		"<leader>sF",
		builtin.git_files,
		description = "Search for git files",
	},
	{
		"<leader>sf",
		builtin.find_files,
		description = "Search for files",
	},
	{
		"<leader>sF",
		function()
			builtin.find_files({ no_ignore = true })
		end,
		description = "Search for files (include ignored files)",
	},
	{
		"<leader>sh",
		builtin.help_tags,
		description = "Search for help",
	},
	{
		"<leader>sw",
		builtin.grep_string,
		description = "Search for current word",
	},
	{
		"<leader>sa",
		builtin.live_grep,
		description = "Search for string in all files",
	},
	{
		"<leader>sA",
		function()
			builtin.live_grep({ additional_args = { "--no-ignore" } })
		end,
		description = "Search for string in all files (include ignored files)",
	},
	{
		"<leader>sk",
		builtin.keymaps,
		description = "Search for keymaps",
	},
	{
		"<leader>sr",
		builtin.resume,
		description = "Resume last search",
	},
})

-- UFO - folding
require("legendary").keymaps({
	{
		"zO",
		require("ufo").openAllFolds,
		description = "Open all folds",
	},
	{
		"zC",
		require("ufo").closeAllFolds,
		description = "Close all folds",
	},
	{
		"zc",
		"<cmd>foldopen<CR>",
		description = "Open fold",
	},
	{
		"zo",
		"<cmd>foldclose<CR>",
		description = "Close fold",
	},
	{
		"<leader>+",
		require("ufo").openAllFolds,
		description = "Open all folds",
	},
	{
		"<leader>_",
		require("ufo").closeAllFolds,
		description = "Close all folds",
	},
	{
		"<leader>=",
		"<cmd>foldopen<CR>",
		description = "Open fold",
	},
	{
		"<leader>-",
		"<cmd>foldclose<CR>",
		description = "Close fold",
	},
	{
		"K",
		function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				local bufnr = vim.api.nvim_get_current_buf()
				local line_nr = vim.fn.line(".")
				local diagnostics = vim.diagnostic.get(bufnr, { lnum = line_nr - 1 })
				if not (diagnostics and type(diagnostics) == "table" and next(diagnostics) ~= nil) then
					vim.lsp.buf.hover()
				end
				vim.diagnostic.open_float()
			end
		end,
		description = "Hover",
	},
})
