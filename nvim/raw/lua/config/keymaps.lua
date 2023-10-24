local util = require('util')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

util.keymaps {
    -- File tree
    ['<leader>e'] = { '<cmd>NvimTreeFocus<CR>', desc = 'nvimTree' },
    -- Git
    ['<leader>gg'] = { '<cmd> LazyGit<CR>', desc = 'LazyGIT' },
    -- Save
    ['<C-s>'] = { '<cmd>w<CR>', mode = { 'n', 'v', 'i' }, desc = 'Save' },
    -- Quit
    ['<C-q>'] = '<cmd>qa<CR>',

    -- portal!
    ["<leader>-"] = { "<cmd>Portal jumplist backward<cr>", desc = "portal <" },
    ["<leader>+"] = { "<cmd>Portal jumplist forward<cr>", desc = "portal >" },

    -- comments
    --['<leader>/'] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>', mode = 'n' },
    --['<leader>/'] = { '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>', mode = 'v' },

    -- window focus
    ['<C-h>'] = '<C-w>h',
    ['<C-j>'] = '<C-w>j',
    ['<C-k>'] = '<C-w>k',
    ['<C-l>'] = '<C-w>l',

    -- Resize window
    ['<C-Up>'] = '<cmd>resize +2<CR>',
    ['<C-Down>'] = '<cmd>resize -2<CR>',
    ['<C-Left>'] = '<cmd>vertical resize -2<CR>',
    ['<C-Right>'] = '<cmd>vertical resize +2<CR>',

    -- Clear search with <esc>
    ['<esc>'] = '<cmd>noh<cr>',

    -- ciw
    ['<C-c>'] = { '<cmd>normal! ciw<cr>a', desc = 'Edit word' },
}

-- buffers
if not util.has_plugin('bufferline.nvim') then
    util.keymaps {
        ['<S-h>'] = { '<cmd>bprevious<cr>', desc = 'Previous buffer' },
        ['<S-l>'] = { '<cmd>bnext<cr>', desc = 'Next buffer' },
        ['[b'] = { '<cmd>bprevious<cr>', desc = 'Previous buffer' },
        [']b'] = { '<cmd>bnext<cr>', desc = 'Next buffer' },
        ['[B'] = { '<cmd>bfirst<cr>', desc = 'First buffer' },
        [']B'] = { '<cmd>blast<cr>', desc = 'Last buffer' },
        ['<Leader>b'] = {
            b = { '<cmd>e #<CR>', desc = 'Cycle Last buffer' },
        },
    }
end

util.keymaps({
    -- Indent without leaving Visual Mode
    ['<'] = '<gv',
    ['>'] = '>gv',
    -- Indent with tab in Visual Mode
    ['<S-Tab>'] = '<gv',
    ['<Tab>'] = '>gv',
}, { mode = 'v' })

-- saner copy/paste atcion
-- Yank to end of line, consistence with D/C
util.keymaps({ ['Y'] = 'y$' }, { mode = 'n' })
-- Yank to system clipboard
util.keymaps({ ['Y'] = '"+y' }, { mode = 'v', remap = true })
-- Paste block
util.keymaps {
    ['[p'] = '<cmd>pu!<cr>',
    [']p'] = '<cmd>pu<cr>',
}

util.keymaps {
    ['\\'] = ':split<CR>',
    ['|'] = ':vsplit<CR>',
    -- ['D-c'] = { '"*y', mode = { 'n', 'v', remap = true } },
    -- ['<S-Up>'] = { ":MoveLine(-1)<CR>", mode = { 'n' } },
    -- ['<S-Down>'] = { ":MoveLine(1)<CR>", mode = { 'n' } }
}

util.keymaps({
    ['<Leader>'] = {
    },
}, { mode = { 'n', 'v' } })
