" ===============================================================================
" General Configuration
" ===============================================================================

let mapleader=','
set nocompatible  " Use the vim's keyboard setting, not vi
set noswapfile    " disable swap file permanently"
set cot-=preview
set nocursorline
set nocursorcolumn

set nu  " Set the line number
syntax on  " Syntax highlighting
"set autochdir  " Set the current dir as thr work dir
filetype on  " File type detection
filetype plugin on  " Loading the plugin files for specific file types
filetype indent on  " Loading the indent file for specific file types with

" Tab and Indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab  " Use the space to instead of tab
set autoindent  " Copy indent from current line when starting a new line
set smartindent
set cindent

" Seach and Match
set hlsearch  " Highlight the search result
set incsearch  " Real-time search
set ignorecase
set smartcase
set showmatch  " When a bracket is inserted, briefly jump to the matching one

" Display
set showmode  " Show the current mode
set t_Co=256  " If under tty, use 256

" Display tab and trail space
set list
set listchars=tab:>-,trail:.
" Not display above list
nmap <leader>l :set list!<CR>

" Other
set nobackup
set fileencodings=utf-8,gb18030,cp936,big5 " Set the encode
" set pastetoggle=<F10>  " Bind `F10` to `:set paste`
set pastetoggle=<leader>p
set backspace=2 " same as ":set backspace=indent,eol,start" in vim7.4

" quicker completion
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

" Press `shift` while selecting with the mouse can disable into visual mode
" In mac os, hold `alt/option` is easier
" ref: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
"set mouse=a  " Enable mouse

" fold rule
set foldmethod=marker  " The kind of folding used for the current window
set foldlevel=99
" synmaxcol
set synmaxcol=200

" Matchlt
" packadd! matchit

" -------------------------------------------------------------------------------
" Easy Map
" -------------------------------------------------------------------------------
" ESC quickly
imap jj <ESC>
" move cursor
inoremap <C-f> <ESC>la
inoremap <C-b> <ESC>ha
" move line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
" insert space line
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
" get filename, full path, directory, relative path
nnoremap <leader>ff :let @+ = expand("%:t")<CR>
nnoremap <leader>fp :let @+ = expand("%:p")<CR>
nnoremap <leader>fd :let @+ = expand("%:p:h")<CR>
nnoremap <leader>fr :let @+ = expand("%")<CR>
" if file name is 'abc.txt'
" expand(‘%:e’) " only extension name e.g. .txt
" expand(‘%:t:r’) " only name but extension name abc
" more info see :help expand

" indent
xnoremap <  <gv
xnoremap >  >gv

" -------------------------------------------------------------------------------
" Plugins
" -------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" FE dev
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'mhartington/vim-typings'
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'Chiel92/vim-autoformat'
" Golang"
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Rust""
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Java
Plug 'artur-shaik/vim-javacomplete2'
Plug 'majutsushi/tagbar'
" Common
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'wakatime/vim-wakatime'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-syntastic/syntastic'
"Plug 'prettier/vim-prettier', {
"    \ 'do': 'npm install',
"    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'  
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/mru.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
"Plug 'xolox/vim-misc'  " vim-easytags requires this
"Plug 'xolox/vim-easytags'
Plug 'mxw/vim-jsx'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

" -------------------------------------------------------------------------------
" fzf
" -------------------------------------------------------------------------------
set rtp+=/usr/local/opt/fzf

" -------------------------------------------------------------------------------
" Ag
" -------------------------------------------------------------------------------
"usage :Ag [options] {pattern} [{directory}]
"shortcuts
"e    to open file and close the quickfix window
"o    to open (same as enter)
"go   to preview file (open but maintain focus on ag.vim results)
"t    to open in new tab
"T    to open in new tab silently
"h    to open in horizontal split
"H    to open in horizontal split silently
"v    to open in vertical split
"gv   to open in vertical split silently
"q    to close the quickfix window

" -------------------------------------------------------------------------------
" nerdtree
" -------------------------------------------------------------------------------
nmap <leader>ne :NERDTreeToggle<CR>

" -------------------------------------------------------------------------------
" nerdtree-git-plugin
" -------------------------------------------------------------------------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" -------------------------------------------------------------------------------
" easymotion + incsearch + fuzzy
" -------------------------------------------------------------------------------
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


" -------------------------------------------------------------------------------
" vim-airline
" -------------------------------------------------------------------------------
" Keep vim-powerline configuration opened
" In Mac with iTerm2, need to select patched font for non-ascii font, in
" Profiles -> Text
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" ----------------------------------------------------------------------------
" airblade/vim-gitgutter
" ----------------------------------------------------------------------------
let g:gitgutter_max_signs = 500
"let g:gitgutter_highlight_lines = 1
highlight clear SignColumn

" -------------------------------------------------------------------------------
" prettier/vim-prettier
" https://prettier.io/docs/en/vim.html#vim-prettier-configuration
" -------------------------------------------------------------------------------
"let g:prettier#autoformat = 0
"let g:prettier#exec_cmd_async = 1
"let g:prettier#quickfix_enabled = 0
"
"autocmd BufWritePre *.js,*.css,*.scss,*.less,*.vue PrettierAsync
"" max line lengh that prettier will wrap on
"let g:prettier#config#print_width = 120
"
"" number of spaces per indentation level
"let g:prettier#config#tab_width = 2
"
"" use tabs over spaces
"let g:prettier#config#use_tabs = 'false'
"
"" print semicolons
"let g:prettier#config#semi = 'false'
"
"" single quotes over double quotes
"let g:prettier#config#single_quote = 'true'
"
"" print spaces between brackets
"let g:prettier#config#bracket_spacing = 'true'
"
"" put > on the last line instead of new line
"let g:prettier#config#jsx_bracket_same_line = 'true'
"
"" none|es5|all
"let g:prettier#config#trailing_comma = 'none'
"
"" flow|babylon|typescript|postcss
"let g:prettier#config#parser = 'flow'

" -------------------------------------------------------------------------------
" Chiel92/vim-autoformat
" -------------------------------------------------------------------------------
"au BufWritePre *.js :Autoformat
"au BufWritePre *.jsx :Autoformat

" -------------------------------------------------------------------------------
" scrooloose/nerdcommenter
" -------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'javascript': { 'left': '// ', 'right': '' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ----------------------------------------------------------------------------
" Shougo/neocomplete.vim
" ----------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete  " for ternjs
autocmd FileType python setlocal omnifunc=jedi#completions  " for jedi
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" -------------------------------------------------------------------------------
" rust-lang/rust.vim
" -------------------------------------------------------------------------------
let g:rustfmt_autosave = 1

" -------------------------------------------------------------------------------
" racer-rust/vim-racer
" -------------------------------------------------------------------------------

let g:racer_experimental_completer = 1

augroup Racer
  autocmd!
  autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
  autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
  autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
  autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
  autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END


" -------------------------------------------------------------------------------
" javascript-libraries-syntax.vim
" -------------------------------------------------------------------------------
let g:used_javascript_libs = 'react,vue'

" -------------------------------------------------------------------------------
" vim-es6
" -------------------------------------------------------------------------------
"Trigger	Result
"gfn→	function* name (arg) { yield arg; }
"=>→	(arg) => { ... },
"class→	class name { constructor () { ...} }
"forof→	for (let value of arr) { ... }
"im→	import lib from 'Library'
"ex→	export default foo

" -------------------------------------------------------------------------------
" JavaComplete2
" -------------------------------------------------------------------------------
nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

" -------------------------------------------------------------------------------
" majutsushi/tagbar
" -------------------------------------------------------------------------------
nmap <leader>t :TagbarOpenAutoClose<CR>


" -------------------------------------------------------------------------------
" mru
" -------------------------------------------------------------------------------
let g:MRU_File = $HOME . '/.vim/.vim_mru_files' 
let g:MRU_Max_Entries = 20
let g:MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let g:MRU_Include_Files = '\.c$\|\.h$|\.js[x]?$'
let g:MRU_Window_Height = 15
let g:MRU_Use_Current_Window = 1
let g:MRU_Auto_Close = 0
let g:MRU_Add_Menu = 0

" -------------------------------------------------------------------------------
" vim-easytags
" -------------------------------------------------------------------------------
" Default/Generic tag file
"set tags=./tag,s~/.vim/.tag

"let g:easytags_async = 1
"let g:easytags_dynamic_files = 1
"let geasytags_autorecurse = 1
"let g:easytags_file = '~/.vim/tags'
"let g:easytags_by_filetype = expand("~/.vim/tags/")
"let g:easytags_resolve_links = 1
"let g:easytags_updatetime_warn = 0
"let g:geasytags_events = ['BufWritePost']
"let g:easytags_languages = { 'php': { 'args': [ '--php-kinds=ncf', '--languages=+JavaScript' ] } }

" Filetype specific tag files (This is used for global IDE tags)
"autocmd FileType c              set tags=.tags_cpp,$HOME/.vim/tags/tags_cpp
"autocmd FileType cpp            set tags=.tags_cpp,$HOME/.vim/tags/tags_cpp
"autocmd FileType css            set tags=.tags_css,$HOME/.vim/tags/tags_css
"autocmd FileType java           set tags=.tags_java,$HOME/.vim/tags/tags_java
"autocmd FileType javascript     set tags=.tags_js,$HOME/.vim/tags/tags_js
"autocmd FileType html           set tags=.tags_html,$HOME/.vim/tags/tags_html
"autocmd FileType sh             set tags=.tags_sh,$HOME/.vim/tags/tags_sh

" -------------------------------------------------------------------------------
" fatih/vim-go
" https://github.com/fatih/vim-go#features
" -------------------------------------------------------------------------------
au BufRead,BufNewFile *.go set filetype=go

" -------------------------------------------------------------------------------
" Markdown
" -------------------------------------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown  " .md default is modula2

" -------------------------------------------------------------------------------
" ref: http://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" -------------------------------------------------------------------------------
autocmd FileType html set shiftwidth=2|set expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
" autocmd InsertLeave,WinEnter * set cursorline
" autocmd InsertEnter,WinLeave * set nocursorline

" -------------------------------------------------------------------------------
" python-mode/python-mode
" -------------------------------------------------------------------------------
let g:pymode_python = 'python3'

" --
" Syntastic
" --
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -------------------------------------------------------------------------------
" Others
" -------------------------------------------------------------------------------
set t_Co=256 " 使用256配色
set background=dark
colorscheme hybrid_reverse

"Fast reloading of the .vimrc
map <silent> <leader>vs :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ve :e ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

if exists('$TMUX')
    set term=screen-256color
endif

set clipboard=unnamed
