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
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'kristijanhusak/vim-hybrid-material'
" FE dev
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
call plug#end()

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
let g:airline_powerline_fonts = 1

" ----------------------------------------------------------------------------
" airblade/vim-gitgutter
" ----------------------------------------------------------------------------
let g:gitgutter_max_signs = 500
"let g:gitgutter_highlight_lines = 1
highlight clear SignColumn

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
