vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.neovide then
  vim.o.guifont = "VictorMono Nerd Font Propo:h15"
  vim.g.neovide_cursor_antialiasing = false
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_show_border = true
end

local git_dir = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
vim.g.gitdir = git_dir ~= ""

vim.g.inlay_hints_visible = true

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.guicursor = "n-v-c:block,i:hor20,r-cr-o:hor20"
vim.opt.history = 100
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.pumheight = 15
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "auto:1"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.wrap = false
vim.opt.writebackup = false

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
