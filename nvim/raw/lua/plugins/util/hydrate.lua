local spec = {
  "stefanlogue/hydrate.nvim",
  lazy = false,
  -- This installs the latest stable release.
  -- Set to false or omit to install the latest development version
  version = "*",
  opts = {
    minute_interval = 20,
    render_style = "default",
    persist_timer = true
  }
}

return { spec }