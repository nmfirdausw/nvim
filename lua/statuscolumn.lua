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

-- Highest-priority sign on a line (extmark signs: gitsigns, diagnostics, ...)
local function get_sign(buf, lnum)
  local marks = vim.api.nvim_buf_get_extmarks(
    buf,
    -1,
    { lnum - 1, 0 },
    { lnum - 1, -1 },
    { type = "sign", details = true }
  )
  local best
  for _, mark in ipairs(marks) do
    local details = mark[4]
    if details and details.sign_text and (not best or (details.priority or 0) > (best.priority or 0)) then
      best = details
    end
  end
  return best
end

-- Sign cell: sign text if any, else a fold marker, else a separator bar
function _G.SignColumn()
  if vim.v.virtnum ~= 0 then
    return "│"
  end
  local lnum = vim.v.lnum
  local sign = get_sign(vim.api.nvim_get_current_buf(), lnum)
  if sign then
    local hl = sign.sign_hl_group or "SignColumn"
    return "%#" .. hl .. "#" .. vim.trim(sign.sign_text) .. "%*"
  end
  if vim.fn.foldclosed(lnum) == lnum then
    return "+"
  end
  if vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1) then
    return "-"
  end
  return "│"
end

vim.opt.statuscolumn = "%{%v:lua.NumberColumn()%} %{%v:lua.SignColumn()%} "
