" ====== Basic Configuration ======
" something

" Don't try to be VI-compatible
set nocompatible

" Show line numbers
"set number

" Show line numbers relatively to the current cursor
"where the current line would show the absolute line number instead.
set number relativenumber

" Syntax highlighting
syntax on

" Stop showing what mode I'm currently on
set noshowmode

" Show the command I'm typing. 
set showcmd

" Set the default encoding to UTF-8
set encoding=utf-8

" Hidden a message to write a file before move to another buffer.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" support 256 colors
set t_Co=256

" Check file types and load the corresponding configuration one.
filetype indent on

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ====== Indentation ======

" Automatically indent when pressing enter .
set autoindent

" Indent based on the syntax currently editing.
set smartindent

" The number of spaces to print when pressing Tab key.
set tabstop=2

" The number of characters to indent.
set shiftwidth=2

" If the number of characters exceeds 80, automatically make a new line.
set textwidth=80

" Turning tab into a space automatically
set expandtab

" How many space each tab will turn into
set softtabstop=2

" 
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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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

" Automatically enclose the bracelets, brackets, parentheses, quotes.
inoremap        {         {}<Left>
inoremap        {<CR>     {<CR>}<Esc>O
inoremap <expr> }         strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap        (         ()<Left>
inoremap        (<CR>     (<CR>)<Esc>O
inoremap <expr> )         strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [         []<Left>
inoremap        [<CR>     [<CR>]<Esc>O
inoremap <expr> ]         strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> "         strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap        "<CR>     "<CR>"<Esc>O
inoremap <expr> """       strpart(getline('.'), col('.')-1, 3) == "\"\"\"" ? "\<Right>\<Right>\<Right>" : "\"\"\"\"\"\"\<Left>\<Left>\<Left>"
inoremap        """<CR>   """<CR>"""<Esc>O
inoremap <expr> '         strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap        '<CR>     '<CR>'<Esc>O
inoremap <expr> '''       strpart(getline('.'), col('.')-1, 3) == "\'\'\'" ? "\<Right>\<Right>\<Right>" : "\'\'\'\'\'\'\<Left>\<Left>\<Left>"
inoremap        '''<CR>   '''<CR>'''<Esc>O
inoremap <expr> `         strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "``\<Left>"
inoremap        `<CR>     `<CR>`<Esc>O
inoremap <expr> ```       strpart(getline('.'), col('.')-1, 3) == "```" ? "\<Right>\<Right>\<Right>" : "``````\<Left>\<Left>\<Left>"
inoremap        ```<CR>   ```<CR>```<Esc>O
inoremap /*               /**/<Left><Left>
inoremap /*<Space>        /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>           /*<CR>*/<Esc>O

" ====== History & Backup ======

" Don't backup my previous edit.
set nobackup

" Automatically change the directory of working files in the same vim session.
set autochdir

" ====== Others ======

" Fuzzy file search in command line
" fzf Installed with Homebrew
"set rtp+=/usr/local/opt/fzf

" Warning if my code is longer than 80 characters.
set colorcolumn=80

" copy and paste in visual mode using standard ctrl-c ctrl-v keys
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" My preferred key-mapping.
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
inoremap jk <Esc>    

" Ensure that the color works properly.
if !has('gui_running')
  set t_Co=256
endif

" ====== Plugins ======

" Enable `vim-plug`, a plug-in manager.
call plug#begin('~/.vim/plugged')

" === Lists of plugin used in `vim-plug` ===

" Lightline, a better look status bar
"Plug 'itchyny/lightline.vim'

" vim-gitbranch, showing git branch on the status bar
Plug 'itchyny/vim-gitbranch'

" vim-airline, the better and better status bar for vim.
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" installing xcode's default theme
"Plug 'arzg/vim-colors-xcode'

" install dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Syntax highlighting-related plugins
"Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
"Plug 'https://github.com/rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'sheerun/vim-polyglot'

" installing signify, where the file changes in git repo
Plug 'mhinz/vim-signify'

" Make git-compatible
Plug 'tpope/vim-fugitive'

" Installing nerdtree
Plug 'scrooloose/nerdtree'

" Enable fzf, terminal-based file manager, as a vim plug-in
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

" Installing one dark theme.
"Plug 'joshdick/onedark.vim'

" Installing Colorizer, the color code highlighting.
Plug 'chrisbra/Colorizer'

" Installing Plugin for Discord presence
"Plug 'vbe0201/vimdiscord'
"Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

" Enable `emmet`
Plug 'mattn/emmet-vim'

" Code completion plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Discord Rich Presence plugin
"Plug 'anned20/vimsence'
"Plug 'hugolgst/vimsence'

" When finishing the plugin lists, run this line too.
call plug#end()

" ====== Plugin configuration ======

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" netrw configuration
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Enable the tab bar.
let g:airline#extensions#tabline#enabled = 1

" Show the tab number on the right of the tabs name.
let g:airline#extensions#tabline#show_tab_count = 1

" Enable powerline for the airline plugin
let g:airline_powerline_fonts = 1

" Set the theme to one dark
"let g:onedark_termcolors = 256
"let g:onedark_terminal_italics = 1
"let g:airline_theme='onedark'
"colorscheme onedark

" Set the theme to Xcode dark theme
"let g:xcodedark_dim_punctuation=0
"let g:xcodedark_emph_funcs=1
"let g:xcodedark_emph_idents=1
"let g:xcodedark_match_paren_style=1
"let g:airline_theme='xcodedark'
"colorscheme xcodedark

" Set the theme to Xcode light theme
"let g:xcodelight_dim_punctuation=0
"let g:xcodelight_emph_funcs=1
"let g:xcodelight_emph_idents=1
"let g:xcodelight_match_paren_style=1
"let g:airline_theme='xcodelight'
"colorscheme xcodelight

" Set the theme to Dracula
let g:airline_theme='dracula'
colorscheme dracula

" Make signify better for async update
set updatetime=100

" Enable Nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd w | endif

" Set the Nerdtree to automatically close when only Nerdtree's tab left in the
" buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Make Nerdtree to be more minimal
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Set the default size of nerdtree
let NERDTreeWinSize = 26

" Enable emmet only for HTML/CSS file
let g:user_emmet_install_global = 1
"autocmd FileType html,css,js,ts EmmetInstall

" Set the default color of menu to the less saturated color.
"hi Directory guifg=#C77F55 ctermfg=yellow

" Enable color code highlighting.
let g:colorizer_auto_color = 1

" Enable highlighting color name.
let g:colorizer_colornames = 1

" Vimsence setting (Discord Rich Presence)
"let g:vimsence_client_id = '439476230543245312'
"let g:vimsence_small_text = 'The best IDE'
"let g:vimsence_small_image = 'vim'
"let g:vimsence_editing_details = 'Editing: {}'
"let g:vimsence_editing_state = 'Working on: {}'
"let g:vimsence_file_explorer_text = 'In NERDTree'
"let g:vimsence_file_explorer_details = 'Looking for files'
"let g:vimsence_custom_icons = {'filetype': 'iconname'}

" vim markdown (part of vim-polyglot)
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_conceal_code_blocks = 0


" =========== coc config ===========
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
