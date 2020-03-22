" --------------------------------- "
"  ____  _             _            "
" |  _ \| |_   _  __ _(_)_ __  ___  "
" | |_) | | | | |/ _` | | '_ \/ __| "
" |  __/| | |_| | (_| | | | | \__ \ "
" |_|   |_|\__,_|\__, |_|_| |_|___/ "
"                |___/              "
" --------------------------------- "

" |- vim-plug
" |-··> Start plugins declarations
call plug#begin() 

    " |- Deoplete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " |- Jedi-VIM :
    " Go-to-definition and similar features (autocompletion is disabled)
    Plug 'davidhalter/jedi-vim'

    " |- Ctrl-P " TODO : Learn
    " Plug 'ctrlpvim/ctrlp.vim'

    " |- Surround
    Plug 'tpope/vim-surround'

    " |- EasyMotion " TODO : Add ?

    " |- NerdTree
    Plug 'scrooloose/nerdTree'

    " |- NerdCommenter
    Plug 'scrooloose/nerdcommenter'

    " |- Lightline
    Plug 'itchyny/lightline.vim'

    " |- Color scheme
    Plug 'patstockwell/vim-monokai-tasty'

    " |- Git integration : TODO : Add ?
    Plug 'tpope/vim-fugitive'

    " Git/mercurial/others diff icons on the side of the file lines
    Plug 'mhinz/vim-signify'

    " |- Code and files fuzzy finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " |- Linters
    Plug 'neomake/neomake'

    " |- Glyphicons (NerdTree included)
    " |-··> Set as final vim-plug
    Plug 'ryanoasis/vim-devicons'

    " |- Startify
    Plug 'mhinz/vim-startify'

    " |- Prettier : TODO : Add ?
    " Plug 'mhinz/vim-startify'

" |-··> End plugins declaration
call plug#end()

" ---------------------------------------- "
"  _  __          _     _           _      "
" | |/ /___ _   _| |__ (_)_ __   __| |___  "
" | ' // _ \ | | | '_ \| | '_ \ / _` / __| "
" | . \  __/ |_| | |_) | | | | | (_| \__ \ "
" |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/ "
"           |___/                          "
" ---------------------------------------- "

" |- Adapt navigation to spanish keyboard (j->ñ) 
map j <Left>
map k <Down>
map l <Up>
map ñ <Right>

" |- Windows navigation 
" |··-> Home row
nnoremap <leader>j <C-W><Left>
nnoremap <leader>k <C-W><Down>
nnoremap <leader>l <C-W><Up>
nnoremap <leader>ñ <C-W><Right>
" |··-> Arrow keys
nnoremap <leader><Left> <C-W><Left>
nnoremap <leader><Down> <C-W><Down>
nnoremap <leader><Up> <C-W><Up>
nnoremap <leader><Right> <C-W><Right>
" |··-> <C-W> combos
nnoremap <C-W>j <C-W><Left>
nnoremap <C-W>k <C-W><Down>
nnoremap <C-W>l <C-W><Up>
nnoremap <C-W>ñ <C-W><Right>

" |- Windows arrengement 
" |··-> Home row
nnoremap <leader>J <C-W>H
nnoremap <leader>K <C-W>J
nnoremap <leader>L <C-W>K
nnoremap <leader>Ñ <C-W>L
" |··-> Arrow keys
nnoremap <leader><Left>  <C-W><Left>
nnoremap <leader><Down>  <C-W><Down>
nnoremap <leader><Up>    <C-W><Up>
nnoremap <leader><Right> <C-W><Right>
" |··-> <C-W> combos
nnoremap <C-W>j  <C-W><Left>
nnoremap <C-W>k  <C-W><Down>
nnoremap <C-W>l  <C-W><Up>
nnoremap <C-W>ñ  <C-W><Right>

" |- Paragraph navigation
nnoremap <M-l> {
nnoremap <M-k> }
vnoremap <M-l> {
vnoremap <M-k> }
nnoremap ł {
nnoremap ĸ }

" |- Line navigation
nnoremap <M-j> 0
nnoremap <M-ñ> $
vnoremap <M-j> 0
vnoremap <M-ñ> $

" |- Tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" |- Special
map <Space> <leader>
map º <Esc>

" |- CtrlP " TODO : Add

" |- Terminal (:ter) escape ter mode
tnoremap <Esc> <C-\><C-n>

" |- Fzf
" |-··> File finder mapping
nmap ,e :Files<CR>
" |-··> Tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" |-··> The same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" |-··> Tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" |-··> The same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" |-··> General code finder in current file mapping
nmap ,f :BLines<CR>
" |-··> The same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" |-··> General code finder in all files mapping
nmap ,F :Lines<CR>
" |-··> The same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" |-··> Commands finder mapping
nmap ,c :Commands<CR>

" |- Visual lines indentation
vmap < <gv
vmap > >gv

" ---------------------------------- "
"   ____             __ _            "
"  / ___|___  _ __  / _(_) __ _ ___  "
" | |   / _ \| '_ \| |_| |/ _` / __| "
" | |__| (_) | | | |  _| | (_| \__ \ "
"  \____\___/|_| |_|_| |_|\__, |___/ "
"                         |___/      "
" ---------------------------------- "

" |- UTF-8
set encoding=UTF-8

" |- Natural splits
set splitbelow
set splitright

" |- Use system clipboard as default register
set clipboard=unnamedplus

" |- Enable mouse support
set mouse=a

" |- Syntax
syntax on

" |- Show numbers
set number

" |- No wrap
set nowrap

" |- Lightline
set laststatus=2 "Always show status line
set noshowmode " Hide --INSERT-- from status line

" |-··> [ Add components ]
"   	|-··> colorscheme : wombat
"   	|-··> colorscheme : monokai_tasty
"   	|--··> git integration : ? @TODO : `:help 'statusline'`
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" |- Vim-Monokai-Tasty
let g:vim_monokai_tasty_italic = 0
colorscheme vim-monokai-tasty

" |- *last-position-jump*
" This autocommand jumps to the last known position in a file
" just after opening it, if the '" mark is set:
:au BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

" |- [ Use persistent history ]
" |-··> Create tmp vim-undo-folder (if it does not exists)
if !isdirectory("/tmp/.vim-undo-dir")
    " rwx permission only to owner
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
" |-··> Configure tmp directory
set undodir=/tmp/.vim-undo-dir
" |-··> Configure tmp directory
set undofile
" |- Tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" |- Change separator character on vertical split
set fillchars+=vert:\|

" |- Autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" |- When scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" |- Clear search results
" nnoremap <silent> // :noh<CR>
nnoremap <space><space> :noh<CR>

" |- Clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" |- NerdCommenter
" |-··> Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" |-··> Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" |-··> Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" |-··> Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" |-··> Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" |-··> Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" |- Neomake
" |-··> Run linter on write
autocmd! BufWritePost * Neomake
" |-··> Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'
" |-··> Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" |- Deoplete :
" |-··> Map options navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1

" |-··> Complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'
set completeopt+=noinsert

" |- Jedi-VIM :
" |-··> Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" |-··> All these mappings work only for python code:
"       |-··> Go to definition
let g:jedi#goto_command = ',d'
"       |-··> Find ocurrences
let g:jedi#usages_command = ',o'
"       |-··> Find assignments
let g:jedi#goto_assignments_command = ',a'
"       |-··> Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" |- NerdTree
" |-··> Toggle NerdTree
nmap <M-º> :NERDTreeToggle<CR>
" |-··> Ignore specific filetypes
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" |-··> How hidden files
let NERDTreeShowHidden=1
" |-··> Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" |-··> Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir
" |-··> Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"
" |-··> Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" |- Activate line highlights
set cursorline
" |-··> Disable current line highlight 
hi clear CursorLine
" |-··> Highlight current line number
hi CursorLineNR cterm=bold

" |- Startify
" |-··> Sessions folder
let g:startify_session_dir = '~/.config/nvim/sessions'
" |-··> List display on welcome screen
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" |-··> Sessions persistence
let g:startify_session_persistence = 1

" |-··> Starting header
let g:fidlet_psa = [
    \ '  ____  ____    _     ',
    \ ' |  _ \/ ___|  / \    ',
    \ ' | |_) \___ \ / _ \   ',
    \ ' |  __/ ___) / ___ \  ',
    \ ' |_|   |____/_/   \_\ ',
    \ ]

let g:startify_custom_header = 
            \ startify#pad(g:fidlet_psa)
