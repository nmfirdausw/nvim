return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "+" },
    },
    numhl = false,
    signcolumn = true,
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns
      vim.keymap.set("n", "]h", gs.next_hunk, { buffer = buffer, desc = "Next hunk" })
      vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = buffer, desc = "Previous hunk" })
      vim.keymap.set("n", "<leader>gn", gs.next_hunk, { buffer = buffer, desc = "Next hunk" })
      vim.keymap.set("n", "<leader>gp", gs.prev_hunk, { buffer = buffer, desc = "Previous hunk" })
      vim.keymap.set("n", "<leader>gs", gs.undo_stage_hunk, { buffer = buffer, desc = "Undo stage hunk" })
      vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { buffer = buffer, desc = "Reset hunk" })
      vim.keymap.set("v", "<leader>gr", ":Gitsigns reset_hunk<CR>", { buffer = buffer, desc = "Reset hunk" })
      vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { buffer = buffer, desc = "Stage buffer" })
      vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { buffer = buffer, desc = "Undo stage Hunk" })
      vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { buffer = buffer, desc = "Reset buffer" })
      vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { buffer = buffer, desc = "Preview hunk" })
      vim.keymap.set("n", "<leader>gb", function()
        gs.blame_line({ full = true })
      end, { buffer = buffer, desc = "View blame line" })
      vim.keymap.set("n", "<leader>gB", function()
        gs.toggle_current_line_blame({ full = true })
      end, { buffer = buffer, desc = "Toggle blame line" })
      vim.keymap.set(
        "o",
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        { buffer = buffer, desc = "GitSigns select Hunk" }
      )
      vim.keymap.set(
        "x",
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        { buffer = buffer, desc = "GitSigns select Hunk" }
      )
      vim.keymap.set("n", "<space>gd", ":<C-U>DiffviewToggle<CR>", { desc = "Toggle diff view" })
    end,
  },
}
