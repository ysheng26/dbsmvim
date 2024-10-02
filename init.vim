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
Plug 'junegunn/vim-easy-align'

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
inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

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

nnoremap <f9> :call DarkLightToggle()<cr>
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

" use system clipboard
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard^=unnamed,unnamedplus

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
nnoremap <space> :nohlsearch<cr>

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
inoremap <c-@> <c-x><c-o>

" Delete spaces after each line
nnoremap <f2> :%s/\s\+$//g <cr> :nohlsearch <cr>

" Map <leader>- and <leader>= to :colder and :cnewer
nnoremap <leader>- :colder<cr>
nnoremap <leader>= :cnewer<cr>

" Quicksave sessions
" Quick write session with f7
nnoremap <f7> :mksession! ~/.vim_session <cr>
" And load session with f8
nnoremap <f8> :source ~/.vim_session <cr>
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
    nmap <buffer> <leader>g <plug>(lsp-definition)
    nmap <buffer> <leader>s <plug>(lsp-references)
    nmap <buffer> <leader>o <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>O <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>i <plug>(lsp-implementation)
    nmap <buffer> <leader>t <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>. <plug>(lsp-code-action)
    nmap <buffer> [d <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]d <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-d> lsp#scroll(+1)
    nnoremap <buffer> <expr><c-u> lsp#scroll(-1)
    inoremap <buffer> <expr><c-d> lsp#scroll(+1)
    inoremap <buffer> <expr><c-u> lsp#scroll(-1)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_hover_ui = 'preview'
let g:lsp_semantic_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
let g:lsp_diagnostics_virtual_text_delay = 200
let g:lsp_diagnostics_virtual_text_align = "right"
let g:lsp_document_code_action_signs_delay = 200



nnoremap <c-p> :Files<cr>
let g:fzf_history_dir = '~/.vim/tmp/fzf-history'


" buffer explorer setup
nnoremap <leader>m :BufExplorer<cr>

" ripgrep with fzf
nnoremap <leader>a :Rg <c-r><c-w><cr>

" Manage split screens
nnoremap <leader>1 :only<cr>
nnoremap <leader>2 :split<cr>
nnoremap <leader>3 :vsplit<cr>
set winminheight=0
set winminwidth=0
set splitbelow
set splitright
nnoremap <leader>x <c-w>\|<c-w>_
nnoremap <leader>k <c-w>z

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>4 :NERDTreeToggle<cr>
nnoremap <leader>5 :NERDTreeFind<cr>

" <leader>6
" <leader>7
" <leader>8
" <leader>9
" are still available
nnoremap <leader>0 :echomsg expand('%:p')<cr>

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
