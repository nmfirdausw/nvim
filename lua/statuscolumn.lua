-- Line number column settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Line number cell: width fits the buffer's line count, blank on wrapped lines
function _G.NumberColumn()
  local buf = vim.api.nvim_get_current_buf()
  local width = math.max(3, #tostring(vim.api.nvim_buf_line_count(buf)))
  if vim.v.virtnum ~= 0 then
    return string.rep(" ", width) .. " "
  end
  return "%" .. width .. "l"
end

vim.opt.statuscolumn = "%{%v:lua.NumberColumn()%} │ "
