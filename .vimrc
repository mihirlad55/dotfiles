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
" <leader>g: Fuzzy git file search
nnoremap <leader>g :GitFiles<cr>


"" Operator-pending Movements
""" p: to inside paranthesis
onoremap p i(
""" in(: inside next paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>
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

"" FZF
set rtp+=~/.fzf

set termguicolors

"" Switch from unsaved buffers
set hidden

"" Highlight search pattern while typing
set incsearch
" }}}



" Colors and Theming ----------------------------------------------| {{{
"colorscheme base16-google-dark "base16-brewer base16-atelier-heath base16-atelier-forest base16-eighties 
"let g:airline_theme='base16_google' "'base16_brewer' 'base16_atelierheath' 'base16_atelierforest' 'base16_eighties'
colorscheme onedark
let g:airline_scheme='onedark'

" Keep background of terminal
highlight Normal guibg=NONE ctermbg=NONE
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
" }}}


" vim-multiple-cursors
let g:multi_cursor_exit_from_insert_mode = 1
let g:multi_cursor_quit_key = 'jk'
