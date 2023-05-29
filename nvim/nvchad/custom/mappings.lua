local utils = require "custom.utils"

local M = {}

M.disabled = {
  n = {
    ["<leader>f"] = "",
    ["<leader>ca"] = "",
    ["<leader>cm"] = "",
    ["<leader>rn"] = "",
    ["<leader>th"] = "",
  },
}

M.general = {
  n = {
    ["<leader>b"] = { "󰓩 Buffers" },
    ["<leader>m"] = { "Mover" },
    ["<leader>g"] = { "󰊢 Git" },
    ["<leader>f"] = { "󰍉 Find" },
    ["<leader>p"] = { "󰏖 Packages" },
    ["<leader>l"] = { " LSP" },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>Ts"] = { "<cmd>Telescope treesitter<cr>", "symbol" },
    ["<leader>Tf"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "find file" },
    ["<leader>x"] = { "<cmd>Portal jumplist backward<cr>", "portal <" },
    ["<leader>z"] = { "<cmd>Portal jumplist forward<cr>", "portal >" },

    ["<leader>bn"] = { "<cmd> tabnew <CR>", "New TAB" },
    ["<leader>w"] = { "<cmd>w<cr>", "Save" },
    ["\\"] = { "<cmd>split<cr>", "Horizontal Split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["<leader>n"] = { "<cmd> enew <CR>", "New buffer" },
  },
}

-- more keybinds!

M.tabufline = {
  plugin = true,

  n = {
    ["<leader>bx"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fW"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        }
      end,
      "Find words in all files",
    },
    ["<leader>fF"] = {
      function()
        require("telescope.builtin").find_files { hidden = true, no_ignore = true }
      end,
      "Find all files",
    },
    ["<leader>ft"] = {
      function()
        require("telescope.builtin").colorscheme { enable_preview = true }
      end,
      "Find themes",
    },
  },
}

M.abc = {
  n = {
    ["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" },
    ["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" },
    ["<leader>pi"] = {
      function()
        require("lazy").install()
      end,
      "Plugins Install",
    },
    ["<leader>ps"] = {
      function()
        require("lazy").home()
      end,
      "Plugins Status",
    },
    ["<leader>pS"] = {
      function()
        require("lazy").sync()
      end,
      "Plugins Sync",
    },
    ["<leader>pu"] = {
      function()
        require("lazy").check()
      end,
      "Plugins Check Updates",
    },
    ["<leader>pU"] = {
      function()
        require("lazy").update()
      end,
      "Plugins Update",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>gg"] = {
      function()
        utils.toggle_term_cmd "lazygit"
      end,
      "ToggleTerm lazygit",
    },
    ["<leader>gl"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "View Git blame",
    },
    ["<leader>gL"] = {
      function()
        require("gitsigns").blame_line { full = true }
      end,
      "View full Git blame",
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview Git hunk",
    },
    ["<leader>gh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset Git hunk",
    },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset Git buffer",
    },
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage Git hunk",
    },
    ["<leader>gS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage Git buffer",
    },
    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Unstage Git hunk",
    },
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "View Git diff",
    },
  },
}
return M
