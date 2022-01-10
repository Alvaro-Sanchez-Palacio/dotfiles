" --------------------------------- "
"  ____  _             _            "
" |  _ \| |_   _  __ _(_)_ __  ___  "
" | |_) | | | | |/ _` | | '_ \/ __| "
" |  __/| | |_| | (_| | | | | \__ \ "
" |_|   |_|\__,_|\__, |_|_| |_|___/ "
"                |___/              "
" --------------------------------- "
" TODO: Add commenter
" TODO: Add flake8

" |- vim-plug
" |-··> Start plugins declarations
call plug#begin() 

    " |- Conqueror of Completion (CoC):
    " Plug 'neoclide/coc.nvim'

    " |- Jedi-VIM
    " Plug 'davidhalter/jedi-vim'

    " |- Deoplete
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " |- Deoplete-Jedi
    " Plug 'deoplete-plugins/deoplete-jedi'
 
    " |- Flake8
    " Plug 'nvie/vim-flake8'

    " |- NerdCommenter
    Plug 'preservim/nerdcommenter'

    " |- VIM-Polyglot
    Plug 'sheerun/vim-polyglot'

    " |- Surround
    Plug 'tpope/vim-surround'

    " |- NerdTree
    Plug 'scrooloose/nerdTree'

    " |- Lightline
    Plug 'itchyny/lightline.vim'

    " |- Color schemes
    " Plug 'patstockwell/vim-monokai-tasty'
    " Plug 'tomasiser/vim-code-dark'
    " Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'

    " |- Git integration
    Plug 'tpope/vim-fugitive'

    " Git/mercurial/others diff icons on the side of the file lines
    Plug 'mhinz/vim-signify'

    " |- Code and files fuzzy finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " |- Glyphicons (NerdTree included) -> Set as last vim-plug
    Plug 'ryanoasis/vim-devicons'

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
" |··-> <C-W> combos
nnoremap <C-W>j <C-W><Left>
nnoremap <C-W>k <C-W><Down>
nnoremap <C-W>l <C-W><Up>
nnoremap <C-W>ñ <C-W><Right>

" |- Windows arrengement 
" |··-> Home row
nnoremap <C-W>J <C-W>H
nnoremap <C-W>K <C-W>J
nnoremap <C-W>L <C-W>K
nnoremap <C-W>Ñ <C-W>L

" |- Windows zoom
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-W>a :ZoomToggle<CR>

" |- Line navigation
nnoremap <M-j> 0
nnoremap <M-ñ> $
vnoremap <M-j> 0
vnoremap <M-ñ> $

" |- Paragraph navigation
nnoremap <M-l> {
nnoremap <M-k> }
vnoremap <M-l> {
vnoremap <M-k> }
nnoremap ł {
nnoremap ĸ }

" |- Tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" |- Tab arrengement
map <M-S-Right> :tabm +1<CR>
imap <M-S-Right> :tabm +1<CR>
map <M-S-Left> :tabm -1<CR>
imap <M-S-Left> :tabm -1<CR>

" |- Special
map <Space> <leader>
imap º <Esc>
nmap ,t :vsplit<CR>:ter<CR>a
nmap ,n :tabnew ~/.config/nvim/init.vim <CR>
nmap <C-S> :w<CR>
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
autocmd Filetype python nnoremap <buffer> <C-B> :w<CR>:sp<CR>:ter python3 "%"<CR>

" |- Terminal (:ter) escape ter mode
tnoremap <Esc> <C-\><C-n>
" |··-> <C-W> combos
tnoremap <C-W>j <C-\><C-n><C-W>h
tnoremap <C-W>k <C-\><C-n><C-W>j
tnoremap <C-W>l <C-\><C-n><C-W>k
tnoremap <C-W>ñ <C-\><C-n><C-W>l
tnoremap <C-W>w <C-\><C-n><C-W>w
tnoremap <C-W><C-W> <C-\><C-n><C-W>w

" |- Fzf
" |-··> File finder mapping
nmap ,e :Files<CR>
" |-··> File finder mapping
nmap ,E :Files ~<CR>
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
" |-··> Buffers list
nmap ,b :Buffers<CR>

" |- Visual lines indentation
vmap < <gv
vmap > >gv

" |- Clear search results
nnoremap <space><space> :noh<CR>

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

" |- Filetypes
" set filetype

" |- Enable filetype for NerdCommenter
filetype plugin on

" |- Natural splits
set splitbelow
set splitright

" |- Use system clipboard as default register
set clipboard=unnamedplus

" |- Enable mouse support
set mouse=a

" |- Syntax
syntax on

" |- Show numbers & make them relative to the current line
set number

" |- No wrap
set nowrap

" |- Jedi-VIM -|
" |- GoTo tabs instead of buffer
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 0

" |- Deoplete -|
" |- Activate at startup
let g:deoplete#enable_at_startup = 1

" |- Flake8 -|
" |-··> Run Flake8 after save
autocmd BufWritePost *.py call Flake8()

" |- Color column: PEP8 comliance for python files and none for the rest
autocmd Filetype * if &ft != "python" | set colorcolumn=0 | else | set colorcolumn=80,120 | endif

" |- NerdCommenter -|
" |- Create default mappings
let g:NERDCreateDefaultMappings = 1

" |- Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" |- Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" |- Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" |- Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" |- Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" |- NerdTree -|
" |-··> Toggle NerdTree
" nmap <M-º> :NERDTreeToggle<CR>
nmap º :NERDTreeToggle<CR>
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

" |- Lightline
set laststatus=2 "Always show status line
set noshowmode " Hide --INSERT-- from status line

" |-··> [ Add components ]
"   	|-··> colorscheme : wombat
"   	|-··> colorscheme : monokai_tasty
"   	|-··> colorscheme : nord
"   	|-··> colorscheme : onedark
"   	|--··> git integration : ? @TODO : `:help 'statusline'`
"   	|-··> TODO: Remove percetage on the lines & add selected lines
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" |- Color Schemes -|
" |-··> Use true colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif
" |-··> Vim-Monokai-Tasty
" let g:vim_monokai_tasty_italic = 0
" colorscheme vim-monokai-tasty
" |-··> Nord
" colorscheme nord
" |-··> VSCode
" colorscheme codedark
" |-··> One Dark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

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
" set fillchars+=vert:\|

" |- Autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
" set wildmode=list:longest

" |- When scrolling, keep cursor 3 lines away from screen border
set scrolloff=5

" |- Clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" |- Line highlights
" |-··> Activate line highlights
set cursorline
" |-··> Disable current line highlight 
" hi clear CursorLine
" |-··> Highlight current line number
hi CursorLineNR cterm=bold
" |- Color column: PEP8 comliance for python files and none for the rest
autocmd Filetype * if &ft != "python" | set colorcolumn=0 | else | set colorcolumn=80 | endif
" |-··> Run SQLFormat (pip) after SQL file save
autocmd BufWritePost *.sql :%!sqlformat --reindent --keywords upper --identifiers lower %

" :%!sqlformat --reindent --keywords upper --identifiers lower %
