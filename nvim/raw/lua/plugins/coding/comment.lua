local spec = {
    'numToStr/Comment.nvim',
    lazy = false,
}

spec.keys = {
    { '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>',                 mode = 'n' },
    { '<leader>/', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', mode = 'v' },

}

return { spec }
