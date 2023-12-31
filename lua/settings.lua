local icons = require("icons")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.markdown_recommended_style = 0

vim.opt.whichwrap:append "<>[]hl"
vim.opt.ruler = false
vim.opt.numberwidth = 2
vim.opt.softtabstop = 2
vim.opt.autowrite = false
vim.opt.backspace:append { "nostop" }
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 3
vim.opt.copyindent = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.diffopt:append "linematch:60"
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars = { eob = " " }
vim.opt.foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.history = 100
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.infercase = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.preserveindent = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.shortmess:append { s = true, I = true }
vim.opt.showmode = true
vim.opt.showtabline = 1
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smoothscroll = true
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.title = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200
vim.opt.viewoptions:remove "curdir"
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.hlsearch = true

vim.filetype.add {
  vim.filetype.add {
    pattern = {
      ["*.blade.php"] = "blade",
    },
  }
}
