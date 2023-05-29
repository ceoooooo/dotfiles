---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  title = true,
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "ayu_dark" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  ----
  statusline = {
    theme = "vscode_colored",
    separator_style = "block"
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- M.utils = require "custom.utils"

return M
