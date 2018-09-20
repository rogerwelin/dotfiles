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
Plugin 'SirVer/ultisnips'
" Language Specific
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-hclfmt'
Plugin 'rust-lang/rust.vim'
call vundle#end()

filetype plugin indent on

syntax enable
"set mouse=a

" -- Plugin-Specific Settings --
set background=dark
colorscheme elflord

" -- General: set leader to ,
let mapleader = ","

" -- bling/vim-airline settings --
" Always show statusbar
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1

" -- nerdtree
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

" -- go/vim
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1

" run go run from vim with ,r
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" go to source code with ,d
autocmd FileType go nmap <leader>d  <Plug>(go-def)
" close source with ,q
autocmd FileType go nmap <leader>q  <Plug>(go-def-pop)

" -- SirVer/ultisnips go snippets
" errp<TAB>   -> err block panic
" errn<TAB>   -> err return block
" ife<TAB>    -> if err condition
" fn<TAB>     -> fmt.Println()
" ff<TAB>     -> fmt.Printf()
" ap<TAB>     -> append
" if<TAB>     -> if block
" else<TAB>   -> else block
" forr<TAB>   -> for range block
" select<TAB> -> select block
" st<TAB>     -> struct block
" json<TAB>   -> `json:""`
" tt<TAB>     -> test table


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
nmap <leader>v :tabedit $MYVIMRC<CR>

"" -- filetype mappings
let maplocalleader = "-"
if has("autocmd")
  autocmd FileType javascript,groovy,go nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType ruby,python nnoremap <buffer> <localleader>c I#<esc>
end

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
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
