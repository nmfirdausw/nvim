local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local icons = require("icons")
local colors = {
  bright_bg = utils.get_highlight("Folded").bg,
  bright_fg = utils.get_highlight("Folded").fg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = utils.get_highlight("String").fg,
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  orange = utils.get_highlight("NormalSB").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  git_del = utils.get_highlight("diffDeleted").fg,
  git_add = utils.get_highlight("diffAdded").fg,
  git_change = utils.get_highlight("diffChanged").fg,
}
local mode_colors = {
  n = colors.green,
  i = colors.orange,
  v = colors.purple,
  V = colors.purple,
  ["\22"] = colors.purple,
  c = colors.red,
  s = colors.purple,
  S = colors.purple,
  ["\19"] = colors.purple,
  R = colors.orange,
  r = colors.orange,
  ["!"] = colors.red,
  t = colors.red,
}

local Space = { provider = " " }
local Align = { provider = "%=" }

local ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,

  provider = "█",

  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = mode_colors[mode] }
  end,
}

local GitBranch = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.mode = vim.fn.mode(1)
    self.status_dict = vim.b.gitsigns_status_dict
  end,

  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = mode_colors[mode] }
  end,

  {
    provider = function(self)
      return " " .. self.status_dict.head
    end,
    hl = { bold = true },
  },
}

local GitDict = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "orange" },

  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and (icons.git.Added .. " " .. count .. " ")
    end,
    hl = { fg = colors.git_add },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and (icons.git.Deleted .. " " .. count .. " ")
    end,
    hl = { fg = colors.git_del },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and (icons.git.Modified .. " " .. count .. " ")
    end,
    hl = { fg = colors.git_change },
  },
}

local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color =
        require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "[No Name]"
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = colors.orange },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = " " .. icons.ui.FileModified .. " ",
    hl = { fg = colors.purple },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " " .. icons.ui.FileReadOnly .. " ",
    hl = { fg = colors.orange },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      return { fg = colors.purple, force = true }
    end
  end,
}

FileNameBlock =
    utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, { provider = "%<" })

local Diagnostics = {
  condition = conditions.has_diagnostics,

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = {
    "DiagnosticChanged",
    "BufEnter",
    "ModeChanged",
  },
  {
    provider = function(self)
      return self.errors > 0 and (icons.diagnostics.Error .. " " .. self.errors .. " ")
    end,
    hl = { fg = colors.diag_error },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (icons.diagnostics.Warning .. " " .. self.warnings .. " ")
    end,
    hl = { fg = colors.diag_warn },
  },
  {
    provider = function(self)
      return self.info > 0 and (icons.diagnostics.Information .. " " .. self.info .. " ")
    end,
    hl = { fg = colors.diag_info },
  },
  {
    provider = function(self)
      return self.hints > 0 and (icons.diagnostics.Hint .. " " .. self.hints .. " ")
    end,
    hl = { fg = colors.diag_hint },
  },
}

local LSPActive = {
  condition = conditions.lsp_attached,
  update = { "LspAttach", "LspDetach" },

  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return table.concat(names, " ") .. " "
  end,
  hl = { fg = colors.orange },
}

local Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = "%7(%l/%3L%):%2c %P",
}

local ScrollBar = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,

  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = mode_colors[mode] }
  end,

  static = {
    sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
    -- Another variant, because the more choice the better.
    -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
}

local GitStatusLine = {
  condition = conditions.is_git_repo,
  GitBranch,
  Space,
  FileNameBlock,
  Space,
  GitDict,
  Diagnostics,
  Align,
  LSPActive,
  Align,
  Ruler,
  Space,
  ScrollBar,
}

local DefaultStatusline = {
  {
    condition = not conditions.is_git_repo,
    ViMode,
    Space,
    FileNameBlock,
    Space,
    GitDict,
    Diagnostics,
    Align,
    LSPActive,
    Align,
    Ruler,
    Space,
    ScrollBar,

    update = {
      "ModeChanged",
      pattern = "*:*",
      callback = vim.schedule_wrap(function()
        vim.cmd("redrawstatus")
      end),
    },
  },
}

local StatusLines = {
  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,
  fallthrough = false,
  GitStatusLine,
  DefaultStatusline,
}
return StatusLines
