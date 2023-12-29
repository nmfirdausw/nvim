vim.api.nvim_exec([[
  augroup BladeFiltypeRelated
    autocmd!
    autocmd BufNewFile,BufRead *.blade.php set ft=blade
  augroup END
]], false)
