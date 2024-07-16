-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

vim.keymap.set('n', '<F5>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<F6>', ':ToggleTerm<CR>', opts)

vim.keymap.set('n', '<Leader><Right>', ':BufferNext<CR>', opts)
vim.keymap.set('n', '<Leader><Left>', ':BufferPrevious<CR>', opts)

vim.keymap.set('n', '<F12>', ':AerialToggle<CR>', opts)
vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', opts)
vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', opts)
