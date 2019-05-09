call plug#begin('~/.vim/plugged') 
 
Plug 'https://github.com/rhysd/vim-clang-format' 
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim' 
Plug 'https://github.com/kana/vim-operator-user' 
Plug 'kaicataldo/material.vim'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:completor_refresh_always = 0 "avoid flickering
let g:completor_python_omni_trigger = ".*"
set formatexpr=LanguageClient_textDocument_rangeFormatting()
set omnifunc=LanguageClient#complete

call plug#end() 

let g:clang_format#detect_style_file = 1 
 
autocmd FileType c,cpp,objc,hpp,h nnoremap <buffer><S-F> :<C-u>ClangFormat<CR> 
autocmd FileType c,cpp,objc,hpp,h vnoremap <buffer><S-F> :ClangFormat<CR> 

set background=dark
colorscheme material

set ic

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

let g:material_theme_style = 'palenight'


autocmd vimenter * wincmd 1
autocmd BufNew * wincmd 1

set rtp+=~/.fzf

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'hpp', 'h'],
      \ })
endif

let g:DoxygenToolkit_briefTag_pre = ""
let g:DoxygenToolkit_licenseTag = "Copyright (c) Purple Fire Robotics"
let g:DoxygenToolkit_versionTag = ""

