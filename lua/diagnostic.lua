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

-- Toggle diagnostic on and off
vim.keymap.set("n", "<leader>td", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostic" })

-- Toggle diagnostic on and off
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostic" })

-- Show diagnostic float, hiding virtual text
vim.keymap.set("n", "<leader>dk", function()
  vim.diagnostic.config({ virtual_text = false })
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })

-- Send buffer's diagnostics to the location list and open
vim.keymap.set("n", "<leader>dl", function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = "Open bufer's diagostic location list" })

-- Send workspace's diagnostics to the quickfix list and open
vim.keymap.set("n", "<leader>dc", function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = "Open workspace's diagostic quickfix list" })
