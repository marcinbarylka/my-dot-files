set nocompatible              " required
filetype off                  " required

let g:python3_host_prog='C:/Users/marci/.config/nvim/venv/Scripts/python.exe'

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'dense-analysis/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'fannheyward/coc-pyright'
  Plug 'jiangmiao/auto-pairs'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'vim-python/python-syntax'
call plug#end()

syntax enable
set background=dark
set termguicolors 
# colorscheme base16-solarized-dark
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


let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

autocmd! bufwritepost .vimrc source %
