" =============================================================================
" File: repo.vim
" Description: Create new help files for the repository, verify repo existences
" Author: Daniel Campoverde Carrión [alx741] <alx741@riseup.net>
" =============================================================================


" exists(path, doc) {{{1
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
