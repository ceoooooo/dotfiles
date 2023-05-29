return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "yamatsum/nvim-nonicons",
    opts = {},
  },
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    opts = function(_, config)
      -- you can configure Hop the way you like here; see :h hop-config
      config.keys = "etovxqpdygfblzhckisuran"
      return config
    end,
    event = "User AstroFile",
    keys = {
      { "<leader>sw", "<cmd>HopWord<cr>", desc = "GO to word" },
      { "<leader>sc", "<cmd>HopChar1<cr>", desc = "GO to chars" },
      { "<leader>ss", "<cmd>HopPattern<cr>", desc = "GO to search" },
      { "<leader>sa", "<cmd>HopAnywhere<cr>", desc = "GO to Anywhere" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- config require
    },
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>Tt", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  {
    "fedepujol/move.nvim",
    event = "User AstroFile",
  },
  {
    "filipdutescu/renamer.nvim",
    branch = "master",
    opts = {
      -- require('rename').setup{}
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User AstroFile",
  },
  {
    "nacro90/numb.nvim",
  },
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    lazy = false,
  },
  {
    "cbochs/portal.nvim",
    -- Optional dependencies
    requires = {
      "cbochs/grapple.nvim",
      "ThePrimeagen/harpoon",
    },
    event = "User AstroFile",
  },
  {
    "folke/twilight.nvim",
    opts = {},
    event = "User AstroFile",
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
    event = "User AstroFile",
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
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body) return vim.fn.system({ "tidy", "-i", "-q", "-" }, body) end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
    },
    lazy = false,
    keys = {
      { "<leader>R", "<Plug>RestNvim<cr>", desc = "REST query" },
    },
  },
  {
    "ggandor/leap.nvim",
    opts = {},
    event = "User AstroFile",
    config = function() require("leap").add_default_mappings() end,
  },
}

