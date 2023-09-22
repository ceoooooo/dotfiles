local spec = {
  'nvimdev/lspsaga.nvim',
  event = "LspAttach",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}

spec.config = function()
  require('lspsaga').setup({
    request_timeout = 4000,
    outline = {
      win_position = "right",
      win_with = "",
      win_width = 30,
      preview_width = 0.4,
      show_detail = false,
      auto_preview = false,
      auto_refresh = true,
      auto_close = false,
      custom_sort = nil,
      keys = {
        expand_or_jump = "o",
        quit = "q",
      },
    },
  })
end

spec.keys = {
  { 'K', '<cmd>Lspsaga hover_doc<CR>' },
  { 'gh', '<cmd>Lspsaga finder<CR>'},
  { 'gp', '<cmd>Lspsaga peek_definition<CR>'},
  { 'gr', '<cmd>Lspsaga lsp_rename<CR>'},
  { '<leader>lo', '<cmd>Lspsaga outline<CR>'},
}

return { spec }