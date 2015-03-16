set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" runtime path settings on windows
" set rtp+=~/vimfiles/bundle/Vundle.vim/
" let path='~/vimfiles/bundle'
" call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'gregsexton/VimCalc'
Plugin 'vim-scripts/a.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ShengYun/vim-conque'
Plugin 'ShengYun/vim-cscope-mapping'
Plugin 'ShengYun/vim-mswin'
Plugin 'ShengYun/vim-dbs-easycolour'
Plugin 'ShengYun/vim-eazycolour'
Plugin 'ShengYun/vim-taghighlight'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mbbill/fencview'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-vividchalk'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'rickharris/vim-blackboard'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'toyamarinyon/vim-swift'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'L9'
Plugin 'FuzzyFinder'


" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Below is customized settings
let mapleader = ","
inoremap jk <Esc>
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

set background=dark
" set background=light
colorscheme jellybeans

" Uncomment when terminals don't have solarized color setup
" let g:solarized_termcolors=256

" setup dark/light toggle button
call togglebg#map("<F9>")

" Alter torte's color
autocmd ColorScheme torte highlight Pmenu ctermbg=grey guibg=grey
autocmd ColorScheme torte highlight Pmenu ctermfg=black guifg=black
autocmd ColorScheme torte highlight PmenuSel ctermbg=red guibg=red
autocmd ColorScheme torte highlight PmenuSel ctermfg=black guifg=black
autocmd ColorScheme torte highlight ModeMsg ctermfg=yellow guifg=yellow

set colorcolumn=80
set cmdheight=2

" molokai colorscheme setup
" If you prefer the scheme to match the original monokai background color,
" put this in your .vimrc file:
" let g:molokai_original = 1
let g:rehash256 = 1

" jellybeans colorscheme customize
let g:jellybeans_overrides = {
\    'MatchParen': { 'guifg': 'ff0000'},
\}

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

" Setup fencview
let g:fencview_autodetect = 0

" Change dir to the first opening file
" and don't auto change dir ever.
cd %:p:h
set noautochdir

" disable backup and swap files
set nobackup
set noswapfile

" Ignore case sensitive
set ignorecase

" Set highlight search result
set hlsearch
nnoremap <Space> :noh<CR>

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
nnoremap <leader><F4> :NERDTreeToggle<CR>

" This is for quickly updating cscope file without using GNU find
nnoremap <leader><F5> :cs kill -1<CR>
    \:!cscope -bqv<CR>
    \:cs add cscope.out<CR>
    \:cs reset<CR>

" F6 to toggle spell check
nnoremap <F6> :setlocal spell! spell?<CR>

" Map <C-]> with :tjump
nnoremap <C-]> :tjump <C-R>=expand("<cword>")<CR><CR>

" Map <c-space> with <c-x><c-o>
inoremap <c-space> <c-x><c-o>

" Delete spaces after each line
nnoremap <F2> :%s/\s\+$//g <CR>

" Bufexplorer
noremap <leader>be :BufExplorer<CR>

" Map <Leader>- and <Leader>= to :colder and :cnewer
nnoremap <Leader>- :colder<CR>
nnoremap <Leader>= :cnewer<CR>

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
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.elf$\|\.o$\
               \|\.obj$\|\.class$\
               \|\.png$\|\.jpg$\|\.jpeg$\|\.bmp$\
               \|\.vsd$\|\.vsdx$\|\.doc$\|\.docx$\
               \|\.xls$\|\.xlsx$',
    \ 'link': '',
    \ }

" Set this to 0 to enable cross-session caching by not deleting the cache files
" upon exiting Vim: >
let g:ctrlp_clear_cache_on_exit = 0

inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
inoremap <expr> <C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-f>"
inoremap <expr> <C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-b>"

" autocmd for vim-colors-solarized and vim-gitgutter
" This line should be removed after https://github.com/altercation/vim-colors-solarized/pull/62
" is merged into vim-colors-solarized's master.
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

" Do not let gitgutter do the realtime update
let g:gitgutter_realtime = 0

nnoremap <leader>j :GitGutterNextHunk<cr>
nnoremap <leader>k :GitGutterPrevHunk<cr>

" neocomplcache setup
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_menu_width = 70
nnoremap <C-\> :NeoComplCacheToggle<CR>

" lock neocomplcache if writting python, jedi will take control
autocmd FileType python execute ':NeoComplCacheLock'

" set foldmethod to indent if editing a python file
autocmd FileType python set foldmethod=indent
autocmd BufRead * normal zR
" set indents to 4 if editing a python file
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

" setup vim-commentary for special files
autocmd FileType python set commentstring=#\ %s
autocmd FileType c set commentstring=//\ %s
autocmd FileType cpp set commentstring=//\ %s

" Ack setup from Steve Losh
" In default, Ack will expand the word under cursor if nothing is provided.
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
let g:ack_use_dispatch = 1

" fugitive Ggrep
nnoremap <Leader>r :Ggrep <C-R><C-W>

" Vim-LaTex setup
" set shellslash
let g:tex_flavor='latex'

" jedi-vim setup
let g:jedi#usages_command = "<leader>s"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal completeopt-=preview

" ruby autocomplete
" :h ft-ruby-omni
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" ruby indentation setup
autocmd FileType ruby,eruby set tabstop=2
autocmd FileType ruby,eruby set softtabstop=2
autocmd FileType ruby,eruby set shiftwidth=2

" Don't know why this does not work with jedi-vim
" set completeopt-=preview

" UltiSnips config
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

if has("win16") || has("win95") || has("win32") || has("win64")
    let g:ycm_global_ycm_extra_conf = 'C:\Program Files\Vim\vimfiles\vimycm\ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf = 0
else
    let g:ycm_global_ycm_extra_conf = '~/.vim/scripts/vimycm/ycm_extra_conf.py'
endif

" This is not working under Windows
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

" YankStack Settings
let g:yankstack_map_keys = 0
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>o <Plug>yankstack_substitute_newer_paste
nnoremap <F11> :Yanks<CR>

" Syntastic settings
let g:syntastic_python_checkers = ['python', 'pep8']
let g:syntastic_c_checkers = ['gcc', 'cppcheck']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck']

" rainbow settings
nnoremap <Leader>` :RainbowToggle<CR>
let g:rainbow_active = 0
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
    \   'operators': '_,_',
    \   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
    \   'separately': {
    \       '*': {},
    \       'vim': {
    \           'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
    \       },
    \       'tex': {
    \           'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
    \       },
    \   }
    \}

" Fuzzyfinder
nnoremap <Leader>u :FufTag<CR>
nnoremap <Leader>m :FufFile**\<CR>

" Manage split screens
nnoremap <Leader>1 :on<CR>
set winminheight=0
set winminwidth=0
set splitbelow
set splitright
nnoremap <Leader>z <C-W>\|<C-W>_

" <Leader>0 to <Leader>9 is reserved for other usages:)

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
" let g:EclimCompletionMethod = 'omnifunc'

" Eclim with neocomplcache
" let g:EclimCompletionMethod = 'omnifunc'

" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

" Eclim java settings
" autocmd FileType java nnoremap <silent> <buffer> <Leader>i :JavaImport<cr>
" autocmd FileType java nnoremap <silent> <buffer> <Leader>d :JavaDocSearch -x declarations<cr>
" autocmd FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
" autocmd FileType java nnoremap <silent> <buffer> K :JavaDocPreview<cr>
" autocmd FileType java setlocal completeopt-=preview

" Eclim python settings
" autocmd FileType python nnoremap <silent> <buffer> <cr> :PythonSearchContext<cr>
" autocmd FileType python nnoremap <silent> <buffer> <cr> :DjangoContextOpen<cr>

" guifont for linux
" set guifont=Monospace\ 13
" set guifont=Inconsolata:h15
" set guifont=DejavuSansMono\ 13

" guifont for mac
" set guifont=Monaco:h18
" set guifont=Inconsolata:h21
" set guifont=DejaVu\ Sans\ Mono:h20

" guifont for windows
" set guifont=Fixedsys:h12
" set guifont=Consolas:h15
" set guifont=Inconsolata:h15
" set guifont=DejaVu\ Sans\ Mono:h13
