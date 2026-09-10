-- Diagnostic display settings
vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = { current_line = true },
  float = { border = "none" },
})

-- Restore virtual text on cursor move, but not inside the float
vim.api.nvim_create_autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("diagnostic_virtual_text", { clear = true }),
  callback = function()
    if vim.fn.mode() ~= "n" then
      return
    end
    if vim.bo.buftype == "nofile" then
      return
    end
    vim.diagnostic.config({ virtual_text = { current_line = true } })
  end,
})

-- Show diagnostic float, hiding virtual text
vim.keymap.set("n", "<leader>dk", function()
  vim.diagnostic.config({ virtual_text = false })
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })
