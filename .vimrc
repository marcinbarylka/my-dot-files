set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Python syntax
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

" Nerdtree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Color
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'morhetz/gruvbox'

" Tons of colorschemes
Plugin 'flazz/vim-colorschemes'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Powerline setup
set laststatus=2

" gitgutter
Plugin 'airblade/vim-gitgutter'
" let g:gitgutter_sign_column_always = 1
set signcolumn=yes

" fugitive
Plugin 'tpope/vim-fugitive'

" Class browser
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" Python-mode
Plugin 'klen/python-mode'
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_virtualenv = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" line numbers
set nu

" autoreload
autocmd! bufwritepost .vimrc source %

set t_Co=256

" paste = F2
set pastetoggle=<F2>
set clipboard=unnamed

set bs=2
set mouse=a

let mapleader = ","
set nowrap
set tw=79
set colorcolumn=80
highlight ColorColumn ctermbg=233
set history=700
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

nmap <leader>t :NERDTree<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set background=dark
colorscheme gruvbox

" GUI fonts
if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 15
    set guioptions-=r
    set guioptions-=T
    set guioptions-=L
endif
