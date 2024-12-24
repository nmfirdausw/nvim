local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = {
  placeholder = "#FFFF00",
  color100 = "#FAFAFA",
  color200 = "#D4D4D4",
  color300 = "#A9A9A9",
  color400 = "#696969",
  color500 = "#505050",
  color600 = "#303030",
  color700 = "#151515",
  color800 = "#000000",
  primary = "#FFBE89",
  success = "#7EAB8E",
  warning = "#FFF2AF",
  error = "#F57A7A",
  none = "none",
}

local mode_colors = {
  n = colors.color100,
  i = colors.primary,
  v = colors.color500,
  V = colors.color500,
  ["\22"] = colors.color500,
  c = colors.error,
  s = colors.warning,
  S = colors.warning,
  ["\19"] = colors.warning,
  R = colors.primary,
  r = colors.primary,
  ["!"] = colors.color100,
  t = colors.color100,
}

local function pathshorten(path)
  local parts = {}
  for part in string.gmatch(path, "([^/]+)") do
    table.insert(parts, part)
  end

  local shortened_parts = {}
  for i = 1, #parts - 1 do
    table.insert(shortened_parts, parts[i]:sub(1, 1))
  end

  table.insert(shortened_parts, parts[#parts])

  return "/" .. table.concat(shortened_parts, "/")
end

local M = {}

M.Align = { provider = "%=" }

M.Space = { provider = " " }

M.ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  static = {
    mode_names = {
      n = "N",
      no = "N",
      nov = "N",
      noV = "N",
      ["no\22"] = "N",
      niI = "N",
      niR = "N",
      niV = "N",
      nt = "N",
      v = "V",
      vs = "V",
      V = "V",
      Vs = "V",
      ["\22"] = "V",
      ["\22s"] = "V",
      s = "S",
      S = "S",
      ["\19"] = "S",
      i = "I",
      ic = "I",
      ix = "I",
      R = "R",
      Rc = "R",
      Rx = "R",
      Rv = "R",
      Rvc = "R",
      Rvx = "R",
      c = "C",
      cv = "E",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
  },
  provider = function(self)
    return self.mode_names[self.mode]
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = mode_colors[mode], bold = true }
  end,
  update = {
    "ModeChanged",
    pat6ern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}

M.FileName = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "[No Name]"
    end
    filename = vim.fn.fnamemodify(filename, ":t")
    if filename == "" then
      return ""
    else
      return filename
    end
  end,
  hl = function()
    if vim.bo.modified then
      return { fg = colors.primary, force = true }
    else
      if not vim.bo.modifiable or vim.bo.readonly then
        return { fg = colors.color500 }
      else
        return { fg = colors.color100 }
      end
    end
  end,
}

M.FileIcon = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
    local extension = vim.fn.fnamemodify(self.filename, ":e")
    self.icon, self.icon_color =
        require("nvim-web-devicons").get_icon_color(self.filename, extension, { default = true })
  end,
  provider = function(self)
    if vim.fn.fnamemodify(self.filename, ":t") == "" then
      return ""
    else
      return self.icon and self.icon
    end
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

M.Path = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  provider = function(self)
    local path = vim.fn.expand("%:.")
    local filename = vim.fn.fnamemodify(self.filename, ":t")
    if filename == path then
      return "○ ./"
    else
      path = vim.fn.fnamemodify(path, ":h")
      if not conditions.width_percent_below(#path, 0.25) then
        path = pathshorten(path)
      end
      return "○ " .. path .. "/"
    end
  end,
  hl = { fg = colors.color100 },
}

M.FileFlags = {
  {
    init = function(self)
      self.filename = vim.api.nvim_buf_get_name(0)
    end,
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = function(self)
      local filename = vim.fn.fnamemodify(self.filename, ":.")
      filename = vim.fn.fnamemodify(filename, ":t")
      if filename == "" then
        return ""
      else
        return "󰍁"
      end
    end,
    hl = { fg = colors.color500 },
  },
}

M.Ruler = {
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  provider = " 󰦨  %3(%P%) %3(%l%) %3(%c%) ",
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = mode_colors[mode] }
  end,
}

M.GitBranch = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    provider = function(self)
      if self.status_dict.head then
        return " " .. self.status_dict.head .. "  "
      else
        return ""
      end
    end,
    hl = { fg = colors.color100 },
  },
}

M.GitStatus = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count .. " ")
    end,
    hl = { fg = colors.success },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count .. " ")
    end,
    hl = { fg = colors.warning },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count .. " ")
    end,
    hl = { fg = colors.error },
  },
}

M.LSPActive = {
  condition = conditions.lsp_attached,
  update = { "LspAttach", "LspDetach" },

  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    return "[" .. table.concat(names, ", ") .. "]"
  end,
  hl = { fg = colors.color100 },
}

M.Diagnostics = {

  condition = conditions.has_diagnostics,

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },
  {
    provider = function(self)
      return self.errors > 0 and ("•" .. self.errors .. " ")
    end,
    hl = { fg = colors.error },
  },
  {
    provider = function(self)
      return self.warnings > 0 and ("•" .. self.warnings .. " ")
    end,
    hl = { fg = colors.warning },
  },
  {
    provider = function(self)
      return self.info > 0 and ("•" .. self.info .. " ")
    end,
    hl = { fg = colors.color100 },
  },
  {
    provider = function(self)
      return self.hints > 0 and ("•" .. self.hints)
    end,
    hl = { fg = colors.success },
  },
}

return M
