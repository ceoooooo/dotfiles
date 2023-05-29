local keymap = vim.keymap.set

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>")
-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

return {
  "glepnir/lspsaga.nvim",
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
  event = "LspAttach",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
}

