return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    local function buildSegments()
      local segments = {}
      if vim.opt.signcolumn:get() ~= "no" then
        table.insert(segments, {
          text = { "%s" },
          click = "v:lua.ScSa",
        })
      end
      if vim.opt.number:get() then
        table.insert(segments, {
          text = { builtin.lnumfunc, " " },
          click = "v:lua.ScLa",
        })
      end
      if vim.opt.foldenable:get() then
        table.insert(segments, {
          text = { builtin.foldfunc, " " },
          click = "v:lua.ScFa",
        })
      end
      return segments
    end

    require("statuscol").setup({
      relculright = vim.opt.relativenumber:get(),
      segments = buildSegments(),
    })

    --Toggle keymaps
    vim.keymap.set("n", "<space>tn", function()
      if vim.opt.number:get() then
        vim.opt.number = false
        vim.opt.relativenumber = false
      else
        vim.opt.number = true
        vim.opt.relativenumber = true
      end
      require("statuscol").setup({
        relculright = vim.opt.relativenumber:get(),
        segments = buildSegments(),
      })
    end, { desc = "Toggle number column" })
    vim.keymap.set("n", "<space>ts", function()
      if vim.opt.signcolumn:get() ~= "no" then
        vim.opt.signcolumn = "no"
      else
        vim.opt.signcolumn = "auto"
      end
      require("statuscol").setup({
        relculright = vim.opt.relativenumber:get(),
        segments = buildSegments(),
      })
    end, { desc = "Toggle sign column" })

    vim.keymap.set("n", "<space>tf", function()
      if vim.opt.foldenable:get() then
        vim.opt.foldenable = false
        vim.opt.foldcolumn = "0"
      else
        vim.opt.foldenable = true
        vim.opt.foldcolumn = "auto:1"
      end
      require("statuscol").setup({
        relculright = vim.opt.relativenumber:get(),
        segments = buildSegments(),
      })
    end, { desc = "Toggle fold column" })
  end,
}
