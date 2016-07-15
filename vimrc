set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" -- Making vim look good --
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
" Text editor stuff
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'elzr/vim-json'
call vundle#end()

filetype plugin indent on

syntax enable
"set mouse=a

" -- Plugin-Specific Settings --
" -- altercation/vim-colors-solarized settings --
set background=dark
colorscheme elflord

" -- bling/vim-airline settings --
" Always show statusbar
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1

" -- nerdtree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

" -- scrooloose/syntastic settings --
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" -- xolox/vim-easytags settings --
" where to look gor tags files
set tags=./tags;,~/.vimtags
" sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" -- majutsushi/tagbar settings --
" open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" open tagbar automatically when possible
autocmd BufEnter * nested :call tagbar#autoopen(0)

"" -- auto-source vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
end

"" -- flexible editing of vimrc with ,v
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>


"" -- General settings -- 
highlight Comment ctermfg=DarkGreen term=italic
set wildmenu
set ignorecase
set smartcase
set magic
set showmatch
set number
set ruler
set showcmd
set encoding=utf8
set expandtab
set shiftwidth=2 softtabstop=2
