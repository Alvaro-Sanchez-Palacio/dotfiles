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
    Plug 'neoclide/coc.nvim'

    " |- Surround
    Plug 'tpope/vim-surround'

    " |- NerdTree
    Plug 'scrooloose/nerdTree'

    " |- Lightline
    Plug 'itchyny/lightline.vim'

    " |- Color schemes
    " Plug 'patstockwell/vim-monokai-tasty'
    Plug 'arcticicestudio/nord-vim'

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

" |- Special
map <Space> <leader>
imap º <Esc>
nmap ,t :vsplit<CR>:ter<CR>a
nmap <C-S> :w<CR>

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
 import BranchHandler
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

" |- Filetypes
set filetype

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

" |- Lightline
set laststatus=2 "Always show status line
set noshowmode " Hide --INSERT-- from status line

" |-··> [ Add components ]
"   	|-··> colorscheme : wombat
"   	|-··> colorscheme : monokai_tasty
"   	|--··> git integration : ? @TODO : `:help 'statusline'`
"   	|-··> TODO: Remove percetage on the lines & add selected lines
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" |- Color Schemes -|
" |-··> Vim-Monokai-Tasty
" let g:vim_monokai_tasty_italic = 0
" colorscheme vim-monokai-tasty
colorscheme nord

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
" set wildmode=list:longest

" |- When scrolling, keep cursor 3 lines away from screen border
set scrolloff=5

" |- Clear search results
nnoremap <space><space> :noh<CR>

" |- Clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" |- CoC -|
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
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
" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansionif has('nvim')
vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
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

" |- NerdTree -|
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

" |- Line highlights
" |-··> Activate line highlights
set cursorline
" |-··> Disable current line highlight 
" hi clear CursorLine
" |-··> Highlight current line number
hi CursorLineNR cterm=bold
" |- Color column: PEP8 comliance for python files and none for the rest
autocmd Filetype * if &ft != "python" | set colorcolumn=0 | else | set colorcolumn=80 | endif
