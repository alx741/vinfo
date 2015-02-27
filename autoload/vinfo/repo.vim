" =============================================================================
" File: repo.vim
" Description: Create new help files for the repository, verify repo existences
" Author: Daniel Campoverde Carrión [alx741] <alx741@riseup.net>
" =============================================================================


" exists(path, doc) {{{1
" Returns TRUE if DOC exists in repo PATH
function! vinfo#repo#exists(path, doc)
    let l:dirs = split(globpath(a:path, '*'), '\n')

    for l:dir in l:dirs
        if l:dir ==? a:doc
            return 1
        endif
    endfor

    return 0
endfunction
" }}}1






" clean(path) {{{1
" Clean all docs in repo PATH
function! vinfo#repo#clean(path)
    exe '!rm -rf ' . a:path . '/*'
endfunction
" }}}1
