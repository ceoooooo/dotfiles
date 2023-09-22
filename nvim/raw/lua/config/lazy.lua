local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- require('lazy.view.config').keys.details = '<Tab>'
-- require("lazy").setup("plugins")
require('lazy').setup {
  spec = {
    { import = 'plugins' },
    { import = 'plugins.ui' },
    { import = 'plugins.editor' },
    { import = 'plugins.util' },
    { import = 'plugins.markdown' },
    { import = 'plugins.coding' },
  },
  defaults = {
    lazy = true, -- every plugin is lazy-loaded by default
    -- version = '*', -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'catppuccin', 'habamax' } },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = { enabled = true, notify = false },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
  ui = {
    border = 'single',
  }
}