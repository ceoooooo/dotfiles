local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "NvChad/nvterm",
    enabled = false,
  },
  {
    "code-biscuits/nvim-biscuits",
    init = function()
      require("core.utils").lazy_load "nvim-biscuits"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
    opts = function(_, config)
      config.cursor_line_only = true
      config.default_config = {
        max_length = 2,
        min_distance = 3,
        trim_by_words = true,
        prefix_string = " 📎 ",
      }
      config.language_config = {
        html = {
          prefix_string = " 🌐 ",
        },
        javascript = {
          prefix_string = " ✨ ",
          max_length = 80,
        },
        python = {
          disabled = true,
        },
      }
      return config
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nacro90/numb.nvim",
  },
  {
    "cbochs/portal.nvim",
    -- Optional dependencies
    requires = {
      "cbochs/grapple.nvim",
      "ThePrimeagen/harpoon",
    },
  },
  {
    "code-biscuits/nvim-biscuits",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
    opts = function(_, config)
      config.cursor_line_only = true
      config.default_config = {
        max_length = 2,
        min_distance = 3,
        trim_by_words = true,
        prefix_string = " 📎 ",
      }
      config.language_config = {
        html = {
          prefix_string = " 🌐 ",
        },
        javascript = {
          prefix_string = " ✨ ",
          max_length = 80,
        },
        python = {
          disabled = true,
        },
      }
      return config
    end,
  },
  {
    "beauwilliams/focus.nvim",
    opts = {},
    lazy = false,
    keys = {
      { "<leader>mh", "<cmd>FocusSplitLeft<cr>", desc = "Split LEFT" },
      { "<leader>mj", "<cmd>FocusSplitDown<cr>", desc = "Split LEFT" },
      { "<leader>mk", "<cmd>FocusSplitUp<cr>", desc = "Split LEFT" },
      { "<leader>ml", "<cmd>FocusSplitRight<cr>", desc = "Split LEFT" },
    },
  },
  {
    "ggandor/leap.nvim",
    opts = {},
    config = function()
      require("leap").add_default_mappings()
    end,
    event = "VeryLazy",
  },
  "glepnir/lspsaga.nvim",
  lazy = false,
  opt = true,
  opts = {
    request_timeout = 4000,
    outline = {
      win_position = "left",
      win_with = "",
      win_width = 30,
      preview_width = 0.4,
      show_detail = true,
      auto_preview = true,
      auto_refresh = true,
      auto_close = true,
      custom_sort = nil,
      keys = {
        expand_or_jump = "o",
        quit = "q",
      },
    },
  },
  branch = "main",
  -- event = "LspAttach",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "fedepujol/move.nvim",
    lazy = false,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 10,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      open_mapping = [[<F7>]],
      shading_factor = 2,
      direction = "float",
      float_opts = {
        border = "curved",
        highlights = { border = "Normal", background = "Normal" },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require("core.utils").lazy_load "todo-comments.nvim"
    end,
    opts = {},
    keys = {
      { "<leader>Tt", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
