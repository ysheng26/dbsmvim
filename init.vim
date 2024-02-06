set nocompatible              " be iMproved, required
filetype off                  " required

if has("win32")
    let path='$VIM/vimfiles/plugged'
    call plug#begin(path)
else
    call plug#begin()
endif

Plug 'jlanzarotta/bufexplorer'
Plug 'preservim/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-capslock'
Plug 'terryma/vim-multiple-cursors'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/searchfold.vim'
Plug 'majutsushi/tagbar'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mbbill/fencview', {'on': 'FencAutoDetect'}

Plug 'tpope/vim-jdaddy', {'for': 'json'}

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()
filetype plugin indent on

" Below is customized settings
let mapleader = ","
let maplocalleader = "\\"
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

" Better indentation
vnoremap < <gv
vnoremap > >gv

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

set t_Co=256
set background=dark
colorscheme PaperColor
let g:airline_theme='papercolor'

nnoremap <F9> :call DarkLightToggle()<cr>
let g:dark_light_switch = 0
function! DarkLightToggle()
    if g:dark_light_switch
        set background=dark
        colorscheme PaperColor
        let g:dark_light_switch = 0
    else
        set background=light
        colorscheme PaperColor
        let g:dark_light_switch = 1
    endif
endfunction

set colorcolumn=80
set cmdheight=2

" Remove menu bar and tool bar
set guioptions=

" Always show statusline
set laststatus=2


" show fencview and fugitive in normal statusline
set statusline=[%n]
set statusline+=%<%f%y%h%m
set statusline+=[%{&fenc!=''?&fenc:&enc}:%{&ff}]
set statusline+=%h%m%r
set statusline+=%{fugitive#statusline()}
set statusline+=\%r%=[%b\ 0x%B]
set statusline+=\ %l\ of\ %L,%c%V
set statusline+=\ Page\ %N
set statusline+=\ %P

" config airline
let g:airline_symbols_ascii = 1

set wildmenu

set list
set listchars=tab:>-,trail:~

" Setup fencview
let g:fencview_autodetect = 0

" Change dir to the first opening file
" and don't auto change dir ever.
cd %:p:h
set noautochdir

" auto read the file when file is changed
set autoread

" Don't redraw the screen when executing macros
set lazyredraw

" disable swap files
set noswapfile

" enable backup files
set backup

" persistant undo
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" several folder locations setup
set undodir=~/.vim/tmp/undo//     " Undo files
set backupdir=~/.vim/tmp/backup// " Backups
set directory=~/.vim/tmp/swap//   " Swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Make sure crontab doesn't explode
" http://vim.wikia.com/wiki/Editing_crontab
set backupskip=/tmp/*,/private/tmp/*

" case sensitive settings
set ignorecase

" Set highlight search result
set hlsearch
nnoremap <Space> :nohlsearch<CR>

" Set search
set incsearch

" Show relative line numbers
set relativenumber

" Show line numbers
set number

" Syntax highlight setting
syntax enable
syntax on

" Set encoding to utf-8
set encoding=utf-8

" Tab and indent settings
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Map <c-space> with <c-x><c-o>
inoremap <c-space> <c-x><c-o>

" Delete spaces after each line
nnoremap <F2> :%s/\s\+$//g <CR> :nohlsearch <CR>

" Map <Leader>- and <Leader>= to :colder and :cnewer
nnoremap <Leader>- :colder<CR>
nnoremap <Leader>= :cnewer<CR>

" Quicksave sessions
" Quick write session with F2
nnoremap <F7> :mksession! ~/.vim_session <CR>
" And load session with F3
nnoremap <F8> :source ~/.vim_session <CR>
" http://stackoverflow.com/questions/9281438/syntax-highlighting-doesnt-work-after-restore-a-previous-vim-session
set sessionoptions-=options

" setup vim-commentary for special files
autocmd FileType python set commentstring=#\ %s
autocmd FileType c set commentstring=//\ %s
autocmd FileType cpp set commentstring=//\ %s

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <Leader>g <plug>(lsp-definition)
    nmap <buffer> <Leader>s <plug>(lsp-references)
    nmap <buffer> <Leader>o <plug>(lsp-document-symbol-search)
    nmap <buffer> <Leader>O <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <Leader>i <plug>(lsp-implementation)
    nmap <buffer> <Leader>t <plug>(lsp-type-definition)
    nmap <buffer> <Leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-j> lsp#scroll(+1)
    " nnoremap <buffer> <expr><c-k> lsp#scroll(-1)
    " inoremap <buffer> <expr><c-j> lsp#scroll(+1)
    " inoremap <buffer> <expr><c-k> lsp#scroll(-1)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" nnoremap <c-p> :FZF!<cr>
nnoremap <c-p> :FZF<cr>
let g:fzf_history_dir = '~/.vim/tmp/fzf-history'

" nerdtree
nnoremap <F4> :NERDTreeToggle<cr>

" buffer explorer setup
nnoremap <Leader>m :BufExplorer<cr>

" ripgrep with fzf
nnoremap <Leader>a :Rg <c-r><c-w><cr>

" Manage split screens
nnoremap <Leader>1 :only<CR>
nnoremap <Leader>2 :split<CR>
nnoremap <Leader>3 :vsplit<CR>
set winminheight=0
set winminwidth=0
set splitbelow
set splitright
nnoremap <Leader>x <C-W>\|<C-W>_

" conflicts with lsp scroll popup
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" <Leader>4
" <Leader>5
" <Leader>6
" <Leader>7
" <Leader>8
" <Leader>9
" are still available
nnoremap <Leader>0 :echomsg expand('%:p')<CR>

" guifont settings
if has("win32")
    " guifont for windows
    set guifont=DejaVu\ Sans\ Mono:h13
elseif has("macunix")
    " guifont for mac
    set guifont=DejaVu\ Sans\ Mono:h18
elseif has("unix")
    " guifont for linux
    set guifont=DejavuSansMono\ 13
endif
