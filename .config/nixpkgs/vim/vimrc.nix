{ pkgs }:
{
  config = ''
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
      " Colors
      if (has("termguicolors"))
          set termguicolors
      endif
      set t_Co=256
      set background=dark
      colorscheme hybrid
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
      set spelllang=fr
      nnoremap <leader>s :set spell!<CR>

      """ Airline configuration
      let g:airline_theme="tomorrow"
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

      set conceallevel=2

      " vim-go
      let g:go_fmt_command = "goimports"
      let g:go_highlight_types = 1
      let g:go_highlight_fields = 1
      let g:go_highlight_functions = 1
      let g:go_highlight_methods = 1
      let g:go_auto_type_info = 1
    '';
}
