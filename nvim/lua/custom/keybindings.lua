-- define common options
local opts = {
  noremap = true, -- non-recursive
  silent = true, -- do not show message
}

vim.keymap.set('n', '<F5>', ':NvimTreeToggle<CR>', opts)
