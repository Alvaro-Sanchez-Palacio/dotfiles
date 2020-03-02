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

" |- Deoplete "
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" |- Surround
Plug 'tpope/vim-surround'

" |- EasyMotion " TODO : Add ?

" |- NerdTree
Plug 'scrooloose/nerdTree'

" |- Ctrl-P " TODO : Learn
Plug 'ctrlpvim/ctrlp.vim'

" |- Lightline
Plug 'itchyny/lightline.vim'

" |- Color scheme
Plug 'patstockwell/vim-monokai-tasty'

" |- Glyphicons (NerdTree included)
" |-··> Set as final vim-plug
Plug 'ryanoasis/vim-devicons'

" |- Git integration : TODO : Add ?
" Plug 'tpope/vim-fugitive'

" |- Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
nnoremap <C-j> <C-W><Left>
nnoremap <C-k> <C-W><Down>
nnoremap <C-l> <C-W><Up>
" TODO : Fix
nnoremap <C-ñ> <C-W><Right> 

nnoremap <leader>j <C-W><Left>
nnoremap <leader>k <C-W><Down>
nnoremap <leader>l <C-W><Up>
nnoremap <leader>ñ <C-W><Right>

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

" |- Special
map <Space> <leader>
map º <Esc>

" |- Deoplete :
" |-··> Map options navigation
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'
set completeopt+=noinsert

" |- NerdTree
nmap <M-º> :NERDTreeToggle<CR>

" |-··> Ignore specific filetypes
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

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

" |- CtrlP " TODO : Add

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

" |- Tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" |- When scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" |- Clear search results
" nnoremap <silent> // :noh<CR>
nnoremap <space><space> :noh<CR>

" |- Clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e


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

