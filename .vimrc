set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fatih/vim-go'
Plugin 'nvie/vim-flake8'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'sheerun/vim-polyglot'
call vundle#end()

syntax on
filetype plugin indent on
set autoindent
set modeline
set modelines=5

" Colorscheme
if (has("termguicolors"))
    set termguicolors
endif
let base16colorspace=256
set background=dark
colorscheme hybrid
set t_co=256

" General configuration
set nu
set cursorline
syntax on
set incsearch
set hlsearch
set showcmd
set bs=2
set notimeout
set laststatus=2
set ruler
set showcmd
set noswapfile
" Set space instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
" Remap leader
let mapleader=','
" Disable search highlighting
nnoremap <Leader>/ :nohl<CR>
" Auto close preview buffer
autocmd CompleteDone * pclose
" List chars
set listchars=tab:→.,trail:.,extends:#,nbsp:.

" Handy shortcut for indentation
vnoremap > >gv
vnoremap < <gv

" Quick buffer switcher
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>N :bprevious<CR>

" Airline config
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_branch = ''
let g:airline_readonly = ''
let g:airline_linenr = ''

" Neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
