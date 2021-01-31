" Vim Plugins -----------------------------------------------------| {{{
call plug#begin('~/.vim/plugged')
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'kana/vim-operator-user'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'chriskempson/base16-vim'
    Plug 'lervag/vimtex'
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'chrisbra/Colorizer'
    Plug 'joshdick/onedark.vim'
    Plug 'jiangmiao/auto-pairs'
call plug#end()
" }}}



" Source other Files ----------------------------------------------| {{{
" Source abbreviations
source ~/.config/nvim/personal.vim
" }}}



" Mappings --------------------------------------------------------| {{{
"" Set leader
let mapleader = "\<space>"


"" Unnamedplus Clipboard
noremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>d "+d
nnoremap <leader>d "+d


"" Move selected line up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


"" No Arrow keys
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
noremap <up> <NOP>
noremap <down> <NOP>
noremap <left> <NOP>
noremap <right> <NOP>
cnoremap <up> <NOP>
cnoremap <down> <NOP>
cnoremap <left> <NOP>
cnoremap <right> <NOP>


" Insert-mode navigation
inoremap <c-k> <up>
inoremap <c-j> <esc>o
inoremap <c-l> <right>


"" Commandline-mode navigation
cnoremap <c-k> <up>
cnoremap <c-j> <down>
cnoremap <c-l> <right>


"" Delay navigation to force relative line number habit
nnoremap hh <NOP>
nnoremap jj <NOP>
nnoremap kk <NOP>
nnoremap ll <NOP>

"" No escape key in insert mode
inoremap <esc> <NOP>
"" jk: Escape from insert mode
inoremap jk <esc>


"" H: go to beinning of current line
nnoremap H 0
"" dH: Delete to end of line
nnoremap dH d0
"" L: go to end of current line
nnoremap L $
"" dL: Delete to end of line
nnoremap dL d$
"" _: go to next underscore-separated word in line
nnoremap - f_l
"" _: go to previous underscore-separated word in line
nnoremap _ F_h
"" _: go to next underscore-separated word in line
vnoremap - f_l
"" _: go to previous underscore-separated word in line
vnoremap _ F_h


"" <leader>ev: edit ~/.vimrc
nnoremap <leader>ev :leftabove vsplit ~/.vimrc<cr>
"" <leader>sv: source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>


"" Put semicolon end of line
nnoremap ; :execute "normal! mqA;\<esc>`q"


"" Window Keybindings
""" <leader>wk: go to above window
nnoremap <leader>wk <c-w>k
""" <leader>wl: go to right window
nnoremap <leader>wl <c-w>l
""" <leader>wh: go to left window
nnoremap <leader>wh <c-w>h
""" <leader>wj: go to below window
nnoremap <leader>wj <c-w>j
""" <leader>wd: close current window
nnoremap <leader>wd :close<cr>
""" <leader>w=: equal width windows
nnoremap <leader>w= <c-w>=
""" <leader>wo: expand current window
nnoremap <leader>wo <c-w>o


"" Scrolling
""" <c-k>: scroll up
nnoremap <c-k> <c-y>
""" <c-j>: scroll down
nnoremap <c-j> <c-e>



" Control+u: convert word to uppercase
inoremap <c-u> <esc>viwUEa

" <leader>": Surround word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" <leader>": Surround word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

"" Buffer
" <leader>bn: Next buffer
nnoremap <leader>bn :bn<cr>
" <leader>bp: Previous buffer
nnoremap <leader>bp :bp<cr>
" <leader>bd: Delete buffer
nnoremap <leader>bd :bdel<cr>
" <leader>bd: Force delete buffer
nnoremap <leader>b!d :bdel!<cr>
" <leader>ba: New buffer
nnoremap <leader>ba :enew<cr>
" <leader>bb: List Buffers
nnoremap <leader>bb :Buffers<cr>


" <leader>f: Fuzzy file search
nnoremap <leader>f :Files<cr>
" <leader>G: Fuzzy git file search
nnoremap <leader>G :GitFiles<cr>


nnoremap gd :call CocAction("jumpDefinition")<cr>
nnoremap <leader>r :call CocAction("rename")<cr>
nnoremap = :call CocAction("format")<cr>
onoremap = :<c-u>call CocAction("formatSelected", visualmode())<cr>


"" Quickfix Mappings {{{2
""" <leader>cn: Go to next quickfix
nnoremap <leader>qn :cnext<cr>
""" <leader>cp: Go to previous quickfix
nnoremap <leader>qp :cprevious<cr>
""" <leader>q: Toggle quickfix
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
"" }}}2


"" <tab> completion {{{2
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"" }}}2


" <leader>/: Stop highlighting items from last search
nnoremap <leader>/ :nohlsearch<cr>


"" Operator-pending Movements
""" p: to inside paranthesis
onoremap p i(
""" in(: inside next paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
""" ): delete to end of block
onoremap ) :normal! f{V%"d<cr>
""" i_: delete inside underscores
onoremap i_ :<c-u>normal! T_vt_<cr>
""" -: delete to next underscore
onoremap - :<c-u>normal! vt_<cr>
""" -: delete to previous underscore
onoremap _ :<c-u>normal! vT_<cr>

" }}}



" Settings --------------------------------------------------------| {{{
"" Relative line numbers
set number relativenumber

"" 80-character marker
set colorcolumn=80
highlight ColorColumn guibg=#373B41

"" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

"" Use mouse
set mouse=a

"" Ignore case when pattern searching
set ignorecase
"" Start highlighting search as it is typed
set incsearch

"" FZF
set rtp+=~/.fzf

set termguicolors

"" Switch from unsaved buffers
set hidden

"" Set default .tex flavor
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
      \ 'build_dir': 'latex-build/'
      \}
" }}}



" Colors and Theming ----------------------------------------------| {{{
"colorscheme base16-google-dark "base16-brewer base16-atelier-heath base16-atelier-forest base16-eighties
"let g:airline_theme='base16_google' "'base16_brewer' 'base16_atelierheath' 'base16_atelierforest' 'base16_eighties'
colorscheme onedark
let g:airline_scheme='onedark'

" Keep background of terminal (for transparency)
highlight Normal guibg=NONE ctermbg=NONE

" Highlight trailing whitespace
let s:whitespace_color = g:terminal_color_1
execute "highlight TrailingWhitespaceError ctermbg=red guibg=" . s:whitespace_color
match TrailingWhitespaceError /\v\s+$/
" }}}



" Autocmds --------------------------------------------------------| {{{
"" Xresources
augroup xresources_group
    " Auto rebuild .Xresources
    autocmd!
    autocmd BufWritePost .Xresources,~/.Xresources.d/* !xrdb ~/.Xresources;
augroup END


"" Set filetype for Special Files
augroup filetypes_group
    autocmd!
    " Set filetype for vifmrc
    autocmd BufRead,BufNewFile vifmrc		            set filetype=vim
    " Set filetype for .config/polybar/config
    autocmd BufRead,BufNewFile .config/polybar/config   set filetype=dosini
augroup END


"" LaTeX
augroup latex_group
    autocmd!
    " Spellcheck for LaTeX
    autocmd BufRead,BufNewFile *.tex
        \ :setlocal spell |
        \ :set spelllang=en_us
    autocmd FileType *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    " Delete temp files on buffer close and get pdf
    autocmd BufDelete,VimLeave,BufWinLeave *.tex silent VimtexStop
    autocmd BufDelete,VimLeave,BufWinLeave *.tex silent VimtexClean
    autocmd BufDelete,VimLeave,BufWinLeave *.tex silent ! cp latex-build/*.pdf .
    autocmd BufDelete,VimLeave,BufWinLeave *.tex silent ! rm -r latex-build
    " Autostart compiling when opened
    autocmd User VimtexEventInitPost call vimtex#compiler#compile()
augroup END


"" Comments
augroup comments_group
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
    autocmd FileType python nnoremap     <buffer> <leader>c I#<esc>
augroup END


"" Vimrc
augroup vimrc_group
    autocmd!
    " Open vim files with all folds closed
    autocmd FileType vim setlocal foldmethod=marker foldlevelstart=0
augroup END

"" rasi
augroup rasi_group
    autocmd!
    " Set filetype for *.rasi
    autocmd BufRead,BufNewFile *.rasi set filetype=css
    autocmd BufRead,BufNewFile *.rasi CocDisable
augroup END


"" Markdown
augroup markdown_group
    autocmd!
    " Set wrap at 80
    autocmd FileType markdown setlocal wrap textwidth=80
augroup END


"" gitcommit
augroup gitcommit_group
    autocmd!
    " Set wrap at 80
    autocmd FileType gitcommit setlocal wrap textwidth=80
augroup END

"" C
augroup c_group
    autocmd!
    autocmd FileType c setlocal foldmethod=syntax
augroup END
" }}}

"" diff
augroup diff_group
    autocmd!
    autocmd FileType diff nnoremap <buffer> <localleader>a 0r+
    autocmd FileType diff nnoremap <buffer> <localleader>d 0r-
    autocmd FileType diff nnoremap <buffer> <localleader>c 0r<space>
    autocmd FileType diff vnoremap <buffer> <localleader>a :s/\v^[-+ ]/+/<cr>:nohlsearch<cr>
    autocmd FileType diff vnoremap <buffer> <localleader>d :s/\v^[-+ ]/-/<cr>:nohlsearch<cr>
    autocmd FileType diff vnoremap <buffer> <localleader>c :s/\v^[-+ ]/ /<cr>:nohlsearch<cr>
augroup END

" vim-multiple-cursors
let g:multi_cursor_exit_from_insert_mode = 1
let g:multi_cursor_quit_key = 'jk'


" dwm-ipc
augroup dwm_ipc_group
  autocmd BufRead,BufNewFile */dwm-ipc/*.c
              \ setlocal softtabstop=2 tabstop=2 shiftwidth=2
  autocmd BufRead,BufNewFile */dwm-ipc/*.h
              \ setlocal softtabstop=2 tabstop=2 shiftwidth=2
augroup END
