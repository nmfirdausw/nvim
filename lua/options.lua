-- Use system clipboard for yank/paste
vim.opt.clipboard:append("unnamedplus")

-- Disable swapfile and backup file creation
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable persistent undo history
vim.opt.undofile = true

-- Hide command line when not in use, always show global statusline
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
