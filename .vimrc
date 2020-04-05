" Remove all autocmds
autocmd!


call plug#begin('~/.vim/plugged') 
 Plug 'https://github.com/rhysd/vim-clang-format' 
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim' 
Plug 'https://github.com/kana/vim-operator-user' 
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
    \ }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'lervag/vimtex'
Plug 'OmniSharp/omnisharp-vim'
Plug 'chrisbra/Colorizer'

call plug#end() 


" CQuery and LanguageClient
let g:completor_refresh_always = 0 "avoid flickering
let g:completor_python_omni_trigger = ".*"
set formatexpr=LanguageClient_textDocument_rangeFormatting()
set omnifunc=LanguageClient#complete

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'hpp', 'h'],
      \ })
endif
let g:clang_format#detect_style_file = 1 
 

" ClangFormat shortcut for C files
autocmd FileType c,cpp,objc,hpp,h nnoremap <buffer><S-F> :<C-u>ClangFormat<CR> 
autocmd FileType c,cpp,objc,hpp,h vnoremap <buffer><S-F> :ClangFormat<CR> 

set termguicolors

" Ignore case
set ic

" FZF
set rtp+=~/.fzf

" Colors
colorscheme base16-google-dark "base16-brewer base16-atelier-heath base16-atelier-forest base16-eighties 
let g:airline_theme='base16_google' "'base16_brewer' 'base16_atelierheath' 'base16_atelierforest' 'base16_eighties'


" Keep background of terminal
hi Normal guibg=NONE ctermbg=NONE

" Use powerline fonts
let g:airline_powerline_fonts = 1


" Spellcheck
autocmd BufRead,BufNewFile *.tex
    \ :setlocal spell |
    \ :set spelllang=en_us
autocmd FileType *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" Bind gy/gp to unnamedplus clipboard
vnoremap gy "+y
vnoremap gp "+p
nnoremap gy "+y
nnoremap gp "+p

" Bind gdy to unnamedplus clipboard
vnoremap gd "+d
nnoremap gd "+d

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
set relativenumber

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
