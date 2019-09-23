filetype off

set path+=.,/usr/local/inclue,/usr/include,**
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'CyCoreSystems/vim-cisco-ios'
Plugin 'fatih/vim-go'
Plugin 'xolox/vim-misc'
Plugin 'vim-scripts/LargeFile'
Plugin 'marshallward/vim-restructuredtext'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'PProvost/vim-ps1'
Plugin 'uarun/vim-protobuf'
Plugin 'tbastos/vim-lua'
Plugin 'elzr/vim-json'
Plugin 'bumaociyuan/vim-swift'
Plugin 'cespare/vim-toml'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'davidhalter/jedi-vim'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()
filetype plugin indent on
set ai
syntax on
set showcmd
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set notimeout
set ttimeout
set ttyfast
set smartcase
" Colors
if exists("$TMUX")
        set t_Co=256
        set notermguicolors
else
        set termguicolors
endif
"if (has("termguicolors"))
"    set termguicolors
"endif
set t_Co=256
set background=dark
colorscheme nord
set t_ut= "bug with tmux
" Others
set noswapfile
set laststatus=2

set nu
set cursorline
let mapleader = ","
nnoremap <leader>/ :let @/ = ""<CR>
set ignorecase
set incsearch
set hlsearch

vnoremap > >gv
vnoremap < <gv

" Toggle spell check
set spelllang=en
nnoremap <leader>s :set spell!<CR>

" NERD Tree
map <F3> :NERDTreeToggle<CR>

" Tagbar
map <F8> :TagbarToggle<CR>

""" Airline configuration
"let g:airline_theme="tomorrow"
" Some more stuff
let g:airline_detect_crypt = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1

" Paste toggle on F2
set pastetoggle=<F2>

" XML indent
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Dockerfile syntax on Dockerfile.exploit files
au BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
" Dockerfile syntax on Dockerfile.exploit files
au BufNewFile,BufRead Vagrantfile set syntax=ruby
" Call GoRun
nnoremap <leader>G :GoRun<CR>

" Auto close completion
autocmd CompleteDone * pclose

" Faster switch between buffers
nnoremap <leader>n :bn<CR>
nnoremap <leader>b :bp<CR>

" Reopen at same line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


" Pandoc markdown to html + open browser
nnoremap <leader>k :!mkhtml echo expand('%:p')<CR>
set conceallevel=2
" vim-markdown adjust new list item indent
let g:vim_markdown_new_list_item_indent = 2
" vim-markdown disable folding
let g:vim_markdown_folding_disabled = 1

" vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_auto_type_info = 1

" Tabular rules
if exists(":Tabularize")
    nmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a= :Tabularize /=<CR>
    nmap <leader>a: :Tabularize /:\zs<CR>
    vmap <leader>a: :Tabularize /:\zs<CR>
endif
