set nocompatible              " required
filetype off                  " required

let g:python3_host_prog='/home/kaczor/.pyenv/versions/nvim/bin/python'

call plug#begin()

  " tree
  " Plug 'preservim/nerdtree'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'  

  " colors 
  Plug 'morhetz/gruvbox'
  Plug 'chriskempson/base16-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'NLKNguyen/papercolor-theme'

  " lualine
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  
  " git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}

  " Vista
  Plug 'liuchengxu/vista.vim'

  " linting -- todo: is it needed?
  Plug 'dense-analysis/ale'
  
  " TypeScript
  Plug 'HerringtonDarkholme/yats.vim'

  " Python
  Plug 'vim-python/python-syntax'
  " Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

call plug#end()

syntax enable
set background=dark
set termguicolors 
colorscheme onedark
set bs=2
set mouse=a
let mapleader = ","
set nowrap
set tw=119
set colorcolumn=120
highlight ColorColumn ctermbg=233
set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
let python_highlight_all=1

" nerdtree
nmap <leader>t :NvimTreeToggle
nnoremap <F5> :NvimTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" terminal
noremap <F6> :sp<CR><C-w>j:res 15<CR>:terminal<CR>

nnoremap = :bn<CR>
nnoremap - :bp<CR>

" line numbers
set nu

" Fix files automatically on save
let g:ale_fixers = {}
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
set signcolumn=yes
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-jedi', 'coc-pyright']  " list of CoC extensions needed

" setup
lua << END
require('nvim-tree').setup{}
END

" lualine config
lua << END
require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'NearestMethodOrFunction', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'fileformat', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
END

" Vista config
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

