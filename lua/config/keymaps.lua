local M = {}

M.set = {
	-- Indent
	{ "<", "<gv", mode = "v" },
	{ ">", ">gv", mode = "v" },
	{ "$", "^" },
	{ "^", "$" },

	{ "<Esc>", "<cmd>nohlsearch<cr>" },

	-- {
	-- 	"<leader>?",
	-- 	function()
	-- 		require("which-key").show({
	-- 			global = false,
	-- 		})
	-- 	end,
	-- 	{ desc = "Buffer local keymaps" },
	-- },

	{ "<BS>", "<CMD>Oil<cr>", desc = "File Explorer" },

	{ "<leader>/", ":Telescope live_grep<cr>", { desc = "Live Grep", silent = true } },
	{ "<leader>.", ":Telescope find_files<cr>", { desc = "Find Files", silent = true } },
	{ "<leader>t", ":Telescope<cr>", { desc = "Telescope", silent = true } },

	{
		"<leader>s",
		function()
			require("snipe").open_buffer_menu()
		end,
		{ desc = "Snipe buffer" },
	},

	-- Bracket navigation
	-- { "[a", "<cmd>previous<cr>", { desc = "Previous" } },
	-- { "]a", "<cmd>next<cr>", { desc = "Next" } },
	-- { "[A", "<cmd>first<cr>", { desc = "First" } },
	-- { "]A", "<cmd>last<cr>", { desc = "Last" } },
	--
	-- { "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" } },
	-- { "]b", "<cmd>bnext<cr>", { desc = "Next buffer" } },
	-- { "[B", "<cmd>bfirst<cr>", { desc = "First buffer" } },
	-- { "]B", "<cmd>blast<cr>", { desc = "Last buffer" } },
	--
	-- { "[l", "<cmd>lprevious<cr>", { desc = "Previous location list" } },
	-- { "]l", "<cmd>lnext<cr>", { desc = "Next location list" } },
	-- { "[L", "<cmd>lfirst<cr>", { desc = "First location list" } },
	-- { "]L", "<cmd>llast<cr>", { desc = "Last location list" } },
	--
	-- { "[q", "<cmd>cprevious<cr>", { desc = "Previous quickfix list" } },
	-- { "]q", "<cmd>cnext<cr>", { desc = "Next quickfix list" } },
	-- { "[Q", "<cmd>cfirst<cr>", { desc = "First quickfix list" } },
	-- { "]Q", "<cmd>clast<cr>", { desc = "Last quickfix list" } },
	--
	-- { "[t", "<cmd>tabprevious<cr>", { desc = "Previous tab" } },
	-- { "]t", "<cmd>tabnext<cr>", { desc = "Next tab" } },
	-- { "[T", "<cmd>tabfirst<cr>", { desc = "First tab" } },
	-- { "]T", "<cmd>tablast<cr>", { desc = "Last tab" } },
	--
	-- { "[<C-l>", "<cmd>lpfile<cr>", { desc = "Last location in previous file" } },
	-- { "]<C-l>", "<cmd>lnfile<cr>", { desc = "First location in next file" } },
	--
	-- { "[<C-q>", "<cmd>cpfile<cr>", { desc = "Last quickfix in previous file" } },
	-- { "]<C-q>", "<cmd>lnfile<cr>", { desc = "First quickfix in next file" } },
}

-- Delete default keymaps
M.del = {
	-- { "[<C-t>" },
	-- { "]<C-t>" },
}

-- Lsp
M.lsp = {
	{ "K", vim.lsp.buf.hover, { desc = "Hover" } },
	{ "gr", vim.lsp.buf.references, { desc = "References" } },
	{ "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" } },
	{ "gt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" } },
	{ "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" } },
	{ "gd", vim.lsp.buf.definition, { desc = "Goto Definition" } },
	{ "gh", vim.lsp.buf.signature_help, { desc = "Signature Help" } },
	{ "<C-h>", vim.lsp.buf.signature_help, { modes = "i", desc = "Signature Help" } },
	{
		"<leader>f",
		"<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
		{ modes = { "n", "x" }, desc = "Format Code" },
	},
	{ "ga", vim.lsp.buf.code_action, { modes = { "n", "v" }, desc = "Code Action" } },
	{ "gl", vim.lsp.codelens.run, { modes = { "n", "v" }, desc = "Run Codelens" } },
	{ "gL", vim.lsp.codelens.refresh, { modes = { "n", "v" }, desc = "Refresh & Display Codelens" } },
	{ "gR", vim.lsp.buf.rename, { desc = "Rename" } },
}

-- Gitsigns
M.git = {
	{
		"]h",
		function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				package.loaded.gitsigns.nav_hunk("next")
			end
		end,
		{ desc = "Next Hunk" },
	},
	{
		"[h",
		function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				package.loaded.gitsigns.nav_hunk("prev")
			end
		end,
		{ desc = "Prev Hunk" },
	},
	{ "]H", function() package.loaded.gitsigns.nav_hunk("last") end, { desc = "Last Hunk" } },
	{ "[H", function() package.loaded.gitsigns.nav_hunk("first") end, { desc = "First Hunk" } },
	{ "<leader>gs", ":Gitsigns stage_hunk<cr>", { modes = { "n", "v" }, desc = "Stage Hunk" } },
	{ "<leader>gr", ":Gitsigns reset_hunk<cr>", { modes = { "n", "v" }, desc = "Reset Hunk" } },
	{ "<leader>gS", ":Gitsigns stage_buffer<cr>", { desc = "Stage Buffer" } },
	{ "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage Hunk" } },
  { "<leader>gR", ":Gitsigns reset_buffer<cr>", { desc = "Reset Buffer" } },
  { "<leader>gp", ":Gitsigns preview_hunk_inline<cr>", { desc = "Preview Hunk Inline" } },
	{ "<leader>gb", function() package.loaded.gitsigns.blame_line({ full = true }) end, { desc = "Blame Line" } },
	{ "<leader>gB", function() package.loaded.gitsigns.blame() end, { desc = "Blame Buffer" } },
	{ "<leader>gtb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle current line blame" } },
	{ "<leader>gtd", ":Gitsigns toggle_deleted<cr>", { desc = "Toggle deleted" } },
	{ "<leader>gtw", ":Gitsigns toggle_word_diff<cr>", { desc = "Toggle word diff" } },
	{ "<leader>gtl", ":Gitsigns toggle_linehl<cr>", { desc = "Toggle line highlight" } },
	{ "<leader>gtn", ":Gitsigns toggle_numhl<cr>", { desc = "Toggle number highlight" } },
	{ "<leader>gts", ":Gitsigns toggle_signs<cr>", { desc = "Toggle signs" } },
	{ "<leader>gB", function() package.loaded.gitsigns.blame() end, { desc = "Blame Buffer" } },
	{ "<leader>gd", ":Gitsigns diffthis<cr>", { desc = "Diff This" } },
	{ "<leader>gd", ":Gitsigns diffthis<cr>", { desc = "Diff This" } },
	{ "<leader>gD", function() package.loaded.gitsigns.diffthis("~") end, { desc = "Diff This ~" } },
	{ "ih", ":<C-U>Gitsigns select_hunk<cr>", { modes = { "o", "x" }, desc = "GitSigns Select Hunk" } },
}

M.laravel = {
	{ "<leader>lc", ":Laravel composer<cr>", desc = "Composer" },
	{ "<leader>la", ":Laravel artisan<cr>", desc = "Artisan" },
	{ "<leader>lr", ":Laravel routes<cr>", desc = "Routes" },
	{ "<leader>lm", ":Laravel make<cr>", desc = "Make" },
	{ "<leader>ls", ":Laravel resources<cr>", desc = "Resources" },
	{ "<leader>lv", ":Laravel view_finder<cr>", desc = "Go to view" },
	{ "<leader>lh", ":Laravel history<cr>", desc = "History" },
}

M.copilot = {
	{ "<leader>cc", ":CopilotChat<cr>", desc = "Chat" },
	{ "<leader>cm", ":CopilotChatCommit<cr>", desc = "Commit" },
	{ "<leader>cf", ":CopilotChatFix<cr>", desc = "Fix" },
	{ "<leader>cw", ":CopilotChatReview<cr>", desc = "Review" },
	{ "<leader>cr", ":CopilotChatReset<cr>", desc = "Reset" },
}

return M
