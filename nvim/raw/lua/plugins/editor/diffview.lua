local spec = {
    'sindrets/diffview.nvim',
    event = { 'BufReadPre', 'BufNewFile' }
}

spec.config = function()
    require("diffview").setup({})
end

return { spec }
