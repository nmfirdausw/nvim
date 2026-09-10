-- Diagnostic display settings
vim.diagnostic.config({
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = { current_line = true },
  float = { border = "none" },
})

-- Show the diagnostic in a float and hiding virtual text
vim.keymap.set("n", "<leader>dk", function()
  vim.diagnostic.config({ virtual_text = false })
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })
