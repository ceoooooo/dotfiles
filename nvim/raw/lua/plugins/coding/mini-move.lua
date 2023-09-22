local spec = {
  'fedepujol/move.nvim',
  lazy = false
}

spec.config = function()
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', '<S-Down>', ':MoveLine(1)<CR>', opts)
  vim.keymap.set('n', '<S-Up>', ':MoveLine(-1)<CR>', opts)
  vim.keymap.set('v', '<S-Down>', ':MoveBlock(1)<CR>', opts)
  vim.keymap.set('v', '<S-Up>', ':MoveBlock(-1)<CR>', opts)
end

return { spec }