vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.history = 100
vim.opt.number = false
vim.opt.numberwidth = 1
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "auto"
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.wrap = true

vim.opt.foldcolumn = "0"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.filetype.add {
  vim.filetype.add {
    pattern = {
      ["*.blade.php"] = "blade",
    },
  }
}
