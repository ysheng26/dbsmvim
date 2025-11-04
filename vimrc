set nocompatible              " be iMproved, required
filetype off                  " required

if has('win32')
    let path='$VIM/vimfiles/plugged'
    call plug#begin(path)
else
    call plug#begin()
endif

if has('nvim')
    set inccommand=nosplit
    set winborder=rounded
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'stevearc/conform.nvim'
    Plug 'stevearc/oil.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'
else
    Plug 'markonm/traces.vim'
    Plug 'airblade/vim-gitgutter'


    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    nnoremap <c-p> :Files<cr>
    nnoremap <leader>a :Rg <c-r><c-w><cr>
    nnoremap g/ :RG <cr>
    let g:fzf_history_dir = '~/.vim/tmp/fzf-history'


    Plug 'jlanzarotta/bufexplorer'
    nnoremap <leader>m :BufExplorer<cr>


    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    function! s:on_lsp_buffer_enabled() abort
        setlocal omnifunc=lsp#complete
        setlocal signcolumn=yes
        if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
        nnoremap <buffer> <leader>g <plug>(lsp-definition)
        nnoremap <buffer> <leader>G <plug>(lsp-declaration)
        nnoremap <buffer> <leader>s <plug>(lsp-references)
        nnoremap <buffer> <leader>t <plug>(lsp-type-definition)
        nnoremap <buffer> <leader>i <plug>(lsp-implementation)
        nnoremap <buffer> gs <plug>(lsp-document-symbol-search)
        nnoremap <buffer> gS <plug>(lsp-workspace-symbol-search)
        nnoremap <buffer> <leader>d <plug>(lsp-document-diagnostics)
        nnoremap <buffer> cd <plug>(lsp-rename)
        nnoremap <buffer> g. <plug>(lsp-code-action)
        nnoremap <buffer> [d <plug>(lsp-previous-diagnostic)
        nnoremap <buffer> ]d <plug>(lsp-next-diagnostic)
        nnoremap <buffer> K <plug>(lsp-hover)
        nnoremap <buffer> <expr><down> lsp#scroll(+1)
        nnoremap <buffer> <expr><up> lsp#scroll(-1)
        nnoremap <buffer> <expr><right> lsp#scroll(+5)
        nnoremap <buffer> <expr><left> lsp#scroll(-5)
        inoremap <buffer> <expr><down> lsp#scroll(+1)
        inoremap <buffer> <expr><up> lsp#scroll(-1)
        inoremap <buffer> <expr><right> lsp#scroll(+5)
        inoremap <buffer> <expr><left> lsp#scroll(-5)

        let g:lsp_format_sync_timeout = 1000
        autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

        " refer to doc to add more commands
    endfunction


    augroup lsp_install
        au!
        " call s:on_lsp_buffer_enabled only for languages that has the server registered.
        autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    augroup END

    " let g:lsp_hover_ui = 'preview'
    let g:lsp_hover_ui = 'float'
    let g:lsp_hover_conceal = 0
    let g:lsp_float_max_width = 0
    let g:lsp_semantic_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_diagnostics_virtual_text_enabled = 0
    let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
    let g:lsp_diagnostics_virtual_text_delay = 200
    let g:lsp_diagnostics_virtual_text_align = 'right'
    let g:lsp_diagnostics_virtual_text_wrap = 'truncate'
    let g:lsp_document_code_action_signs_delay = 200

endif

Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/searchfold.vim'

Plug 'junegunn/vim-easy-align'

Plug 'mbbill/fencview', {'on': 'FencAutoDetect'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

Plug 'tpope/vim-jdaddy', {'for': 'json'}

Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'Mofiqul/vscode.nvim'

call plug#end()
filetype plugin indent on

" Below is customized settings
let mapleader = ','
let maplocalleader = '\\'
inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
xnoremap p P

" Better indentation
vnoremap < <gv
vnoremap > >gv

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

set termguicolors
set t_Co=256
set background=dark
" let g:molokai_original = 1
" let g:rehash256 = 1
" colorscheme molokai
colorscheme unokai

set background=light
" colorscheme wildcharm
colorscheme vscode

" if !has('nvim')
"     colorscheme rosepine_moon
" endif

set colorcolumn=80
set cmdheight=2

" Remove menu bar and tool bar
set guioptions=

" Always show statusline
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


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
" set clipboard^=unnamed,unnamedplus

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
    call mkdir(expand(&undodir), 'p')
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), 'p')
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
set maxmempattern=2000000

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


if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat+=%f:%l:%c:%m
endif

" Manage split screens
nnoremap <leader>1 :only<cr>
nnoremap <leader>2 :split<cr>
nnoremap <leader>3 :vsplit<cr>
set winminheight=0
set winminwidth=0
set splitbelow
set splitright
nnoremap <leader>x <c-w>\|<c-w>_

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

let g:netrw_liststyle = 3

" <leader>4
" <leader>5
" <leader>6
" <leader>7
" <leader>8
" <leader>9
" are still available
nnoremap <leader>0 :echomsg expand('%:p')<cr>

" guifont settings
if has('win32')
    " guifont for windows
    set guifont=DejaVu\ Sans\ Mono:h13
elseif has('macunix')
    " guifont for mac
    set guifont=DejaVu\ Sans\ Mono:h18
elseif has('unix')
    " guifont for linux
    set guifont=DejavuSansMono\ 13
endif

if has('nvim')
    lua require('setup')
endif

