set nocompatible              " be iMproved, required
filetype off                  " required

if has("win32")
    let path='$VIM/vimfiles/plugged'
    call plug#begin(path)
else
    call plug#begin()
endif

Plug 'gcmt/taboo.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jlanzarotta/bufexplorer'
Plug 'ShengYun/vim-cscope-mapping'
Plug 'ShengYun/vim-mswin'
Plug 'ShengYun/vim-gnu-global'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neocomplcache.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'Valloric/YouCompleteMe'
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/searchfold.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'mhinz/vim-grepper'

" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'

Plug 'gregsexton/VimCalc', {'on': 'Calc'}
Plug 'vim-scripts/a.vim', {'on': 'A'}
Plug 'mbbill/fencview', {'on': 'FencAutoDetect'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'luochen1990/rainbow', {'on': 'RainbowToggle'}
Plug 'junegunn/vim-easy-align', {'on': 'LiveEasyAlign'}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim', {'on': 'Limelight'}

Plug 'tpope/vim-jdaddy', {'for': 'json'}

Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': 'javascript'}

Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'vim-scripts/matchit.zip', {'for': 'html'}

Plug 'vim-latex/vim-latex', {'for': 'tex'}

Plug 'davidhalter/jedi-vim', {'for': 'python'}

Plug 'dawikur/algorithm-mnemonics.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Plug 'rizzatti/dash.vim'
" Plug 'ShengYun/vim-dbs-easycolour'
" Plug 'ShengYun/vim-eazycolour'
" Plug 'ShengYun/vim-taghighlight'
" Plug 'jonathanfilip/vim-lucius'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-tbone'
"
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/neoyank.vim'
" Plug 'Shougo/neomru.vim'
" Plug 'Shougo/unite.vim', {'on': 'Unite'}

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

" Alter torte's color
autocmd ColorScheme torte highlight Pmenu ctermbg=grey guibg=grey
autocmd ColorScheme torte highlight Pmenu ctermfg=black guifg=black
autocmd ColorScheme torte highlight PmenuSel ctermbg=red guibg=red
autocmd ColorScheme torte highlight PmenuSel ctermfg=black guifg=black
autocmd ColorScheme torte highlight ModeMsg ctermfg=yellow guifg=yellow

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

" show fencview and fugitive in statusline
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
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

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

" set foldmethod to indent if editing a python file
" autocmd FileType python set foldmethod=indent
" autocmd BufRead * normal zR

" set indents to 4 if editing a python file
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

" ruby indentation setup
autocmd FileType ruby,eruby set tabstop=2
autocmd FileType ruby,eruby set softtabstop=2
autocmd FileType ruby,eruby set shiftwidth=2

" web development indentation setup
autocmd FileType html,xml,css,javascript set tabstop=2
autocmd FileType html,xml,css,javascript set softtabstop=2
autocmd FileType html,xml,css,javascript set shiftwidth=2

" javascript-libraries-syntax.vim setup
let g:used_javascript_libs = 'jquery,angularjs'

" Setup vimgrep
"noremap <silent> <C-F3> :call Search_Word()<CR>:copen<CR>
"function Search_Word()
"    let w = expand("<cword>")
"    execute ":noautocmd vimgrep " w "**"
"endfunction

" Set a.vim's shortcut
nnoremap <F12> :A<CR>

" Use F4 to call Tabbar
nnoremap <F4> :TagbarToggle<CR>

" Use leader F4 to call Nerdtree
nnoremap <Leader><F4> :NERDTreeToggle<CR>

" This is for quickly updating cscope file without using GNU find
nnoremap <Leader><F5> :cs kill -1<CR>
    \:!cscope -bqv<CR>
    \:cs add cscope.out<CR>
    \:cs reset<CR>

" Map <C-]> with :tjump
nnoremap <C-]> :tjump <C-R>=expand("<cword>")<CR><CR>

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

" CtrlP config

" Set this to 1 to set searching by filename (as opposed to full path) as the
" default: >
let g:ctrlp_by_filename = 1

" Set this to 1 to set regexp search as the default: >
let g:ctrlp_regexp = 1

" 1 - the parent directory of the current file.
" 2 - the nearest ancestor that contains one of these directories or files:
"     .git/ .hg/ .svn/ .bzr/ _darcs/
" 0 - don't manage working directory.
let g:ctrlp_working_path_mode = 0

" Set this to 1 to enable the lazy-update feature: only update the match window
" after typing been stopped for a certain amount of time: >
"
" If is 1, update after 250ms. If bigger than 1, the number will be used as the
" delay time in milliseconds.
let g:ctrlp_lazy_update = 1

" The maximum number of files to scan, set to 0 for no limit: >
let g:ctrlp_max_files = 0

" Set the maximum height of the match window: >
let g:ctrlp_max_height = 70

" In addition to |'wildignore'|, use this for files and directories you want only
" CtrlP to not show. Use regexp to specify the patterns: >
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|elf|o|obj|class|jar
    \               |png|jpg|jpeg|bmp|vsd|vsdx|doc|docx|xls|xlsx)$',
    \ 'link': '',
    \ }

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"

" autocmd for vim-gitgutter
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

" Do not let gitgutter do the realtime update
let g:gitgutter_realtime = 0

" neocomplcache setup
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_menu_width = 70
nnoremap <C-\> :NeoComplCacheToggle<CR>

" lock neocomplcache if writting python, jedi will take control
autocmd FileType python execute ':NeoComplCacheLock'

" setup vim-commentary for special files
autocmd FileType python set commentstring=#\ %s
autocmd FileType c set commentstring=//\ %s
autocmd FileType cpp set commentstring=//\ %s

" Grepper
nnoremap <Leader>a :Grepper<space>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" fugitive Ggrep
nnoremap <Leader>r :Ggrep <C-R><C-W>

" if executable("fzf")
"     let g:loaded_ctrlp = 1
"     nnoremap <c-p> :FZF!<cr>
"     let g:fzf_history_dir = '~/.vim/tmp/fzf-history'
" endif

" buffer explorer setup
nnoremap <Leader>m :BufExplorer<cr>

" undotree
nnoremap <F5> :UndotreeToggle<cr>

if executable("ag")
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " CtrlP with ag
    " bug: can't ignore files by g:ctrlp_custom_ignore
    if has( 'unix' )
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    elseif has( 'win32' )
        let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
    endif
endif

" Vim-LaTex setup
" set shellslash
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

" jedi-vim setup
let g:jedi#usages_command = "<Leader>s"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal completeopt-=preview

" ruby autocomplete
" :h ft-ruby-omni
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Don't know why this does not work with jedi-vim
" set completeopt-=preview

" UltiSnips config
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

if has("win32")
    let g:ycm_global_ycm_extra_conf = 'C:\Program Files\Vim\vimfiles\vimycm\ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
else
    let g:ycm_global_ycm_extra_conf = '~/.vim/scripts/vimycm/ycm_extra_conf.py'
endif

" This is not working under Windows
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

" Disable youcompleteme diagnostic ui
let g:ycm_show_diagnostics_ui = 0

" YankStack Settings
let g:yankstack_map_keys = 0
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>o <Plug>yankstack_substitute_newer_paste
nnoremap <F11> :Yanks<CR>

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'pep8']
let g:syntastic_c_checkers = ['gcc', 'cppcheck']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck']

" rainbow settings
let g:rainbow_active = 0
let g:rainbow_conf = {
    \   'guifgs': ['Red', 'DarkCyan', 'Magenta', 'Orange'],
    \   'ctermfgs': ['DarkRed', 'DarkCyan', 'DarkMagenta', 'DarkYellow'],
    \   'operators': '_,_',
    \   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
    \   'separately': {
    \       '*': {},
    \       'vim': {
    \           'parentheses': [['fu\w* \s*.*)','endfu\w*'],
    \                           ['for','endfor'],
    \                           ['while', 'endwhile'],
    \                           ['if','_elseif\|else_','endif'],
    \                           ['(',')'], ['\[','\]'], ['{','}']],
    \       },
    \       'tex': {
    \           'parentheses': [['(',')'], ['\[','\]'],
    \                           ['\\begin{.*}','\\end{.*}']],
    \       },
    \   }
    \}

" taboo settings
let g:taboo_tab_format = " %N:[%f%m] "

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Manage split screens
nnoremap <Leader>1 :only<CR>
nnoremap <Leader>2 :split<CR>
nnoremap <Leader>3 :vsplit<CR>
set winminheight=0
set winminwidth=0
set splitbelow
set splitright
nnoremap <Leader>x <C-W>\|<C-W>_
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" <Leader>4, <Leader>5, <Leader>6 are still available
nnoremap <Leader>0 :echomsg expand('%:p')<CR>
nnoremap <Leader>7 :SyntasticToggleMode<CR>
nnoremap <Leader>8 :Limelight!!<CR>
nnoremap <Leader>9 :RainbowToggle<CR>

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion = 1

" To enable YouCompleteMe
" 1) Comment let g:loaded_youcompleteme = 1
" 2) Uncomment let g:jedi#completions_enabled = 0
" 3) Uncomment g:neocomplcache_enable_at_startup = 0

" let g:loaded_youcompleteme = 1
let g:jedi#completions_enabled = 0
let g:neocomplcache_enable_at_startup = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Eclim Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Eclim with YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" Eclim with neocomplcache
" let g:EclimCompletionMethod = 'omnifunc'

" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

" Eclim java settings
autocmd FileType java nnoremap <silent> <buffer> <Leader>i :JavaImport<cr>
autocmd FileType java nnoremap <silent> <buffer> <Leader>d :JavaDocSearch -x declarations<cr>
autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
autocmd FileType java nnoremap <silent> <buffer> K :JavaDocPreview<cr>
autocmd FileType java setlocal completeopt-=preview

" Eclim python settings
autocmd FileType python nnoremap <silent> <buffer> <cr> :PythonSearchContext<cr>
" autocmd FileType python nnoremap <silent> <buffer> <cr> :DjangoContextOpen<cr>

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
