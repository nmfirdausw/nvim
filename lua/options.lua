vim.g.mapleader = " "
vim.g.maplocalleader = "."

local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
vim.g.gitdir = git_dir ~= ""

vim.opt.backup = false
vim.opt.breakindent = trus
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.expandtab = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "auto"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.history = 100
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.list = trus
vim.opt.listchars = "tab: \\ ,trail:-,eol:⬎"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.preserveindent = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smoothscroll = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 100
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.updatetime = 200
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
vim.opt.writebackup = false

vim.filetype.add({
	vim.filetype.add({
		pattern = {
			["*.blade.php"] = "blade",
		},
	}),
})

local signs = {
	Error = "●",
	Warn = "●",
	Hint = "●",
	Info = "●",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
