" ===============================================================================
" General Configuration
" ===============================================================================

let mapleader=','
imap jj <ESC>
set nocompatible  " Use the vim's keyboard setting, not vi

set nu  " Set the line number
syntax on  " Syntax highlighting
"set autochdir  " Set the current dir as thr work dir
filetype on  " File type detection
filetype plugin on  " Loading the plugin files for specific file types
filetype indent on  " Loading the indent file for specific file types with

" Tab and Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
"set expandtab  " Use the space to instead of tab
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

" Press `shift` while selecting with the mouse can disable into visual mode
" In mac os, hold `alt/option` is easier
" ref: http://stackoverflow.com/questions/4608161/copy-text-out-of-vim-with-set-mouse-a-enabled
"set mouse=a  " Enable mouse

set foldmethod=indent  " The kind of folding used for the current window
set foldlevel=99

" -------------------------------------------------------------------------------
" Easy Map
" -------------------------------------------------------------------------------
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ` ``<ESC>i
inoremap <C-f> <ESC>la
inoremap <C-b> <ESC>ha

" -------------------------------------------------------------------------------
" Enhanced
" -------------------------------------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown  " .md default is modula2

" -------------------------------------------------------------------------------
" Plugins
" -------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Common
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
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
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'  
" FE dev
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
" Golang"
Plug 'fatih/vim-go'
call plug#end()

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
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0

autocmd BufWritePre *.js,*.css,*.scss,*.less PrettierAsync
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 120

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|postcss
let g:prettier#config#parser = 'flow'

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
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ----------------------------------------------------------------------------
" Shougo/neocomplete.vim
" ----------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
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
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=tern#Complete  " for ternjs
autocmd FileType python setlocal omnifunc=jedi#completions  " for jedi
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" -------------------------------------------------------------------------------
" ref: http://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" -------------------------------------------------------------------------------
autocmd FileType html set shiftwidth=2|set expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

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
