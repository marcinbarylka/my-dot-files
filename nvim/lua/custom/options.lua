-- NOTE
-- Here go custom options for my setup:

require('gruvbox').setup {
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
  },
}

vim.g.python3_host_prog = 'home/kaczor/.pyenv/versions/nvim/bin/python'
vim.cmd.colorscheme 'kanagawa'
vim.wo.colorcolumn = '120' -- highlight the 120th column

vim.o.showtabline = 2

vim.notify 'Custom options loaded.'
