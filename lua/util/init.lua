local M = {}

function M.set_keymap(keymap)
  local lhs = keymap[1]
  local rhs = keymap[2]
  local opts = keymap[3] or {}

  if opts.modes then
    local modes = opts.modes
    opts.modes = nil
    if type(modes) == "table" then
      for _, mode in ipairs(modes) do
        vim.keymap.set(mode, lhs, rhs, opts)
      end
    elseif type(modes) == "string" then
      vim.keymap.set(modes, lhs, rhs, opts)
    else
      error("opts.modes must be a string or a table")
    end
  else
    vim.keymap.set("n", lhs, rhs, opts)
  end
end

function M.delete_keymap(keymap)
  local lhs = keymap[1]
  local opts = keymap[2] or {}

  if opts.modes then
    local modes = opts.modes
    opts.modes = nil
    vim.keymap.del(modes, lhs, opts)
  else
    vim.keymap.del("n", lhs, opts)
  end
end

return M
