-- Improve default
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move Line
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Toggle
vim.keymap.set("n", "<leader>tw", function()
  if vim.opt.wrap:get() then
    vim.opt.wrap = false
  else
    vim.opt.wrap = true
  end
end, { desc = "Toggle wrap line" })

vim.keymap.set("n", "<leader>cp", function()
  vim.bo.filetype = "php"
  vim.cmd('LspRestart')
end, { desc = "Change filetype to php" })

vim.keymap.set("n", "<leader>cb", function()
  vim.bo.filetype = "blade"
  vim.cmd('LspRestart')
end, { desc = "Change filetype to blade" })

vim.keymap.set("n", "<leader>ch", function()
  vim.bo.filetype = "html"
  vim.cmd('LspRestart')
end, { desc = "Change filetype to html" })

vim.keymap.set("n", "<leader>tt", ":terminal<cr>",{ desc = "Terminal" })

-- Comment
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle line comment" })
vim.keymap.set(
  "v",
  "<leader>/",
  "<Esc><Cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Toggle line comment for selection" }
)
vim.keymap.set(
  "v",
  "<leader>?",
  "<Esc><Cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
  { desc = "Toggle block comment for selection" }
)

-- Buffer
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate buffer" })

-- Slit
vim.keymap.set("n", "<C-H>", require("smart-splits").resize_left, { desc = "Resize left" })
vim.keymap.set("n", "<C-J>", require("smart-splits").resize_down, { desc = "Resize down" })
vim.keymap.set("n", "<C-K>", require("smart-splits").resize_up, { desc = "Resize up" })
vim.keymap.set("n", "<C-L>", require("smart-splits").resize_right, { desc = "Resize right" })
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Focus left split" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Focus lower split" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Focus upper split" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Focus right split" })
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap with left split" })
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap with lower split" })
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap with upper split" })
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap with right split" })

-- Telescope
local builtin = require("telescope.builtin")
local function telescope_live_grep_current_buffer()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Current Buffer",
  })
end

vim.keymap.set("n", "<leader>sq", builtin.oldfiles, { desc = "Search for recently opened files" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search for buffers" })
vim.keymap.set("n", "<leader>ss", function()
  builtin.current_buffer_fuzzy_find()
end, { desc = "String in current buffer (Fuzzy)" })
vim.keymap.set("n", "<leader>sS", telescope_live_grep_current_buffer, { desc = "String in current buffer (Grep)" })
vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "Open Telescope" })
vim.keymap.set("n", "<leader>sF", builtin.git_files, { desc = "Search for git files" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search for files" })
vim.keymap.set("n", "<leader>sF", function()
  builtin.find_files({ no_ignore = true })
end, { desc = "Search for files (include ignored files)" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search for help" })
vim.keymap.set("n", "<leader>sH", builtin.highlights, { desc = "Search for help" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search for current word" })
vim.keymap.set("n", "<leader>sa", builtin.live_grep, { desc = "Search for string in all files" })
vim.keymap.set("n", "<leader>sA", function()
  builtin.live_grep({ additional_args = { "--no-ignore" } })
end, { desc = "Search for string in all files (include ignored files)" })
vim.keymap.set(
  "n",
  "<leader>sk",
  ":lua require'telescope.builtin'.keymaps(require('telescope.themes').get_ivy({}))<cr>",
  { desc = "Search for keymaps" }
)
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume last search" })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Diagnostic float" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
    vim.keymap.set(
      "n",
      "<leader>li",
      vim.lsp.buf.implementation,
      { buffer = ev.buf, desc = "Go to implementation" }
    )
    vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "View signature help" })
    vim.keymap.set(
      "n",
      "<leader>lt",
      "<cmd>telescope lsp_type_definitions<cr>",
      { buffer = ev.buf, desc = "Show LSP type definitions" }
    )
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Smart rename" })
    vim.keymap.set(
      "n",
      "<leader>la",
      vim.lsp.buf.code_action,
      { buffer = ev.buf, desc = "See available code actions" }
    )
    vim.keymap.set(
      "n",
      "<leader>lR",
      "<cmd>telescope lsp_references<cr>",
      { buffer = ev.buf, desc = "Show LSP references" }
    )
    vim.keymap.set(
      "n",
      "<leader>dl",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      { buffer = ev.buf, desc = "Document diagnostics list (Trouble)" }
    )
    vim.keymap.set(
      "n",
      "<leader>dL",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { buffer = ev.buf, desc = "Workspace diagnostics list (Trouble)" }
    )
    vim.keymap.set(
      "n",
      "<leader>xd",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      { buffer = ev.buf, desc = "Document diagnostics list" }
    )
    vim.keymap.set(
      "n",
      "<leader>xD",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { buffer = ev.buf, desc = "Workspace diagnostics list (Trouble)" }
    )
    vim.keymap.set(
      "n",
      "<leader>xr",
      "<cmd>TroubleToggle lsp_references<cr>",
      { buffer = ev.buf, desc = "LSP references list" }
    )
    vim.keymap.set(
      "n",
      "<leader>sd",
      "<cmd>telescope diagnostics<cr>",
      { buffer = ev.buf, desc = "Search for diagnostics" }
    )
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = ev.buf, desc = "Format code" })
  end,
})

vim.keymap.set("n", "K", function()
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
end, { desc = "Hover" })

-- Folds
vim.keymap.set("n", "zO", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zC", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zc", "<cmd>foldopen<CR>", { desc = "Open fold" })
vim.keymap.set("n", "zo", "<cmd>foldclose<CR>", { desc = "Close fold" })
vim.keymap.set("n", "<leader>+", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "<leader>_", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "<leader>=", "<cmd>foldopen<CR>", { desc = "Open fold" })
vim.keymap.set("n", "<leader>-", "<cmd>foldclose<CR>", { desc = "Close fold" })
