" ====== Basic Configuration ======

" Don't try to be VI-compatible
set nocompatible

" Show line numbers
"set number

" Show line numbers relatively to the current cursor
set relativenumber

" Syntax highlighting
syntax on

" Stop showing what mode I'm currently on
set noshowmode

" Show the command I'm typing. 
set showcmd

" Set the default encoding to UTF-8
set encoding=utf-8

" support 256 colors
set t_Co=256

" Check file types and load the corresponding configuration one.
filetype indent on

" ====== Indentation ======

" Automatically indent when pressing enter .
set autoindent

" Indent based on the syntax currently editing.
set smartindent

" The number of spaces to print when pressing Tab key.
set tabstop=2

" The number of characters to indent.
set shiftwidth=2

" Turning tab into a space automatically
set expandtab

" How many space each tab will turn into
set softtabstop=2

" ====== Appearance ======

" Show a cursor line on a line I'm typing in.
set cursorline

" Wrap the line automatically.
set wrap

" Break a lines using specified characters only (such as space, hyphen or others)
set linebreak

" Whether to display a status bar.
" - 0: No display
" - 1: Display only in multi-window
" - 2: Display
set laststatus=2

" Show the current position of the cursor.
set ruler

" ====== Search ======

" Highlight the corresponding parenthesis.
set showmatch

" Highlight the match when searching
set hlsearch

" Each time when enter a character in search, jump to the first match automatically.
set incsearch

" Ignore case when searching
set ignorecase

" ====== Edit ======

" Turn on the spell checking for English words.
"set spell spelllang=en_us

" Don't make any noise when an error occurs.
set noerrorbells

" When error occurs, a visual cue will be given.
"set visualbell

" Monitoring files automatically, it will be prompting
" If any external changes happened to the file during
" editing.
set autoread

" List all matched operation instructions when pressing Tab in command.
set wildmenu
set wildmode=longest:list,full

" Enable the backspace to delete EOL, indent, start of the insert
set backspace=indent,eol,start

" Enable auto-commenting when pressing <Enter>, useful when needed to
" type many lines of comments.
set formatoptions+=cor

" ====== History & Backup ======

" Don't backup my previous edit.
set nobackup

" Automatically change the directory of working files in the same vim session.
set autochdir

" ====== Others ======

" Fuzzy file search in command line
" fzf Installed with Homebrew
set rtp+=/usr/local/opt/fzf

" Warning if my code is longer than 80 characters.
set colorcolumn=80

" copy and paste in visual mode using standard ctrl-c ctrl-v keys
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Ensure that the color works properly.
if !has('gui_running')
  set t_Co=256
endif

" ====== Plugins ======

" Enable `vim-plug`, a plug-in manager.
call plug#begin('~/.vim/plugged')

" === Lists of plugin used in `vim-plug` ===

" Lightline, a better look status bar
Plug 'itchyny/lightline.vim'

" vim-gitbranch, showing git branch on the status bar
Plug 'itchyny/vim-gitbranch'

" Syntax highlighting-related plugins
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'elzr/vim-json'
 
" Make git-compatible
Plug 'tpope/vim-fugitive' 

" Enable fzf, terminal-based file manager, as a vim plug-in
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" When finishing the plugin lists, run this line too.
call plug#end()

" ====== Plugin configuration ======

" Lightline
let g:lightline = {
  \ 'colorscheme': 'OldHope',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
\ }
