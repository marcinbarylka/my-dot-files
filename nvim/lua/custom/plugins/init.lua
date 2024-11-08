-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- color themes
  { 'ellisonleao/gruvbox.nvim' },
  { 'sainnhe/sonokai' },
  { 'sainnhe/everforest' },
  { 'sainnhe/gruvbox-material' },
  { 'folke/lsp-colors.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'Mofiqul/dracula.nvim' },
  { 'NLKNguyen/papercolor-theme' },

  -- nvim-tree
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-tree/nvim-tree.lua', opts = {} },

  -- Copilot
  { 'github/copilot.vim' },

  -- terminal
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    version = '*',
    opts = {
      size = 15,
      open_mapping = '<c-s>',
    },
  },

  -- tabs and buffers
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {},
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  -- aerial (outline)
  { 'stevearc/aerial.nvim' },
}
