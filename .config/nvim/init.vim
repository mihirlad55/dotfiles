" Use .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


let g:LanguageClient_serverCommands = {
\ 'cpp': ['~/cquery/build/release/bin/cquery', 
\ '--log-file=/tmp/cq.log', 
\ '--init={"cacheDirectory":"/tmp/cquery/", "completion": {"filterAndSort": false}}']}                                                                                                                                    
let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()


nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
