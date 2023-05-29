-- swap
vim.opt.swapfile = false
-- color
vim.opt.termguicolors = true
--
-- portal
vim.keymap.set("n", "<leader>x", "<cmd>Portal jumplist backward<cr>")
vim.keymap.set("n", "<leader>z", "<cmd>Portal jumplist forward<cr>")
--

-- sets
local opts = { noremap = true, silent = true }
vim.keymap.set('n', ';', ":", {nowait = true, silent = true})

vim.keymap.set("n", "d", '"_d', opts)
vim.keymap.set("v", "d", '"_d', opts)

vim.keymap.set("n", "<C-c>", '"*y', opts)
vim.keymap.set("v", "<C-c>", '"*y', opts)

vim.keymap.set("n", "<S-Down>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<S-Up>", ":MoveLine(-1)<CR>", opts)

vim.keymap.set("v", "<S-Down>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<S-Up>", ":MoveBlock(-1)<CR>", opts)

vim.keymap.set("n", "rn", '<cmd>lua require("renamer").rename()<cr>', opts)
--

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_nam] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin-mocha",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 5000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

