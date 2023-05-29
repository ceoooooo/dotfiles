-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local opt = vim.opt

opt.swapfile = false

opt.list = true
opt.listchars = "tab:| ,lead:·,trail:~,eol:$,extends:>,precedes:<"

vim.keymap.set("n", "<leader>x", "<cmd>Portal jumplist backward<cr>")
vim.keymap.set("n", "<leader>z", "<cmd>Portal jumplist forward<cr>")

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "d", '"_d', opts)
vim.keymap.set("v", "d", '"_d', opts)

vim.keymap.set("n", "\\", ":split<CR>")
vim.keymap.set("n", "|", ":vsplit<CR>")

vim.keymap.set("n", "<C-c>", '"*y', opts)
vim.keymap.set("v", "<C-c>", '"*y', opts)

vim.keymap.set("n", "<S-Down>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<S-Up>", ":MoveLine(-1)<CR>", opts)

vim.keymap.set("v", "<S-Down>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<S-Up>", ":MoveBlock(-1)<CR>", opts)
