set nocompatible              " required
filetype off                  " required

let g:python3_host_prog='/home/kaczor/.pyenv/versions/nvim/bin/python'

call plug#begin()

  " tree
  Plug 'preservim/nerdtree'

  " colors 
  Plug 'morhetz/gruvbox'
  Plug 'chriskempson/base16-vim'

  " lualine
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  
  " git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'

  Plug 'dense-analysis/ale'
  Plug 'HerringtonDarkholme/yats.vim'
  
  " Python
  Plug 'vim-python/python-syntax'
  Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
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
nmap <leader>t :NERDTreeToggle
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

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
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-jedi']  " list of CoC extensions needed
autocmd! bufwritepost .vimrc source %

" lualine config
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = bubbles_theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
