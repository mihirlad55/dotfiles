" Remove all autocmds
autocmd!


call plug#begin('~/.vim/plugged') 
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim' 
Plug 'https://github.com/kana/vim-operator-user'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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


set termguicolors

" Ignore case
set ic

" FZF
set rtp+=~/.fzf

" Colors
"colorscheme base16-google-dark "base16-brewer base16-atelier-heath base16-atelier-forest base16-eighties 
"let g:airline_theme='base16_google' "'base16_brewer' 'base16_atelierheath' 'base16_atelierforest' 'base16_eighties'
colorscheme onedark
let g:airline_scheme='onedark'


" Keep background of terminal
hi Normal guibg=NONE ctermbg=NONE

" Use powerline fonts
let g:airline_powerline_fonts = 1


" Spellcheck
autocmd BufRead,BufNewFile *.tex
    \ :setlocal spell |
    \ :set spelllang=en_us
autocmd FileType *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" Set leader
let mapleader = "\<space>"


" Bind gy/gp to unnamedplus clipboard
noremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Bind gdy to unnamedplus clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" No Arrow keys
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

noremap <up> <NOP>
noremap <down> <NOP>
noremap <left> <NOP>
noremap <right> <NOP>

" Auto rebuild .Xresources
autocmd BufWritePost .Xresources,~/.Xresources.d/* !xrdb ~/.Xresources;

" Relative line numbers
set number relativenumber

" 80-character marker
set colorcolumn=80
highlight ColorColumn guibg=#373B41

" Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Use mouse
set mouse=a

" Set filetypes
au BufRead,BufNewFile vifmrc		            set filetype=vim
au BufRead,BufNewFile .config/polybar/config    set filetype=dosini
