syntax on                       " syntax highlighting, see :help syntax
filetype plugin indent on       " file type detection, see :help filetype
set number                      " display line number
set path+=**                    " improves searching, see :help path
set noswapfile                  " disable use of swap files
set wildmenu                    " completion menu
set backspace=indent,eol,start  " ensure proper backspace functionality
set undodir=~/.cache/nvim/undo  " undo ability will persist after exiting file
set undofile                    " see :help undodir and :help undofile
set incsearch                   " see results while search is being typed, see :help incsearch
set smartindent                 " auto indent on new lines, see :help smartindent
set ic                          " ignore case when searching
set colorcolumn=119             " display color when line reaches pep8 standards
set expandtab                   " expanding tab to spaces
set tabstop=4                   " setting tab to 4 columns
set shiftwidth=4                " setting tab to 4 columns
set softtabstop=4               " setting tab to 4 columns
set showmatch                   " display matching bracket or parenthesis
set hlsearch incsearch          " highlight all pervious search pattern with incsearch
set termguicolors

highlight ColorColumn ctermbg=9

" Python binding
let g:python3_host_prog = $HOME . '/.pyenv/versions/nvim/bin/python'

" Keybind Ctrl+l to clear search
nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

"vim-plug configuration, plugins will be installed in ~/.config/nvim/plugged
call plug#begin()

  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'romgrk/barbar.nvim'

  " Python
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'vim-python/python-syntax'
  Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}

  " colors
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/edge'
  Plug 'sainnhe/gruvbox-material'
  Plug 'sainnhe/everforest'

  " lualine
  Plug 'nvim-lualine/lualine.nvim'

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'

  " Vista
  Plug 'liuchengxu/vista.vim'

  " Github Copilot
  Plug 'github/copilot.vim'


call plug#end()

" neovim LSP Configuration
lua require('lua_config')

" Enable Tab / Shift Tab to cycle completion options
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_fuzzy_match = 1
set completeopt=menuone,noinsert,noselect

" remapping leader key to space
let mapleader=" "

" remapping Meta+PgUp and Meta+PgDn to navigate through buffers
nnoremap <M-Left> :bprevious<CR>
nnoremap <M-Right> :bnext<CR>

" remapping Ctrl+PgUp and Ctrl+PgDn to navigate through tabs        
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" remapping Ctrl+Shift+PgUp and Ctrl+Shift+PgDn to move tabs
nnoremap <C-S-Left> :tabmove -1<CR>   
nnoremap <C-S-Right> :tabmove +1<CR>

" nerdtree
nmap <leader>t :NvimTreeToggle
nnoremap <F5> :NvimTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Fix files automatically on save
let g:ale_fixers = {}

" colorscheme & syntax
colorscheme gruvbox-material
let python_highlight_all=1

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

