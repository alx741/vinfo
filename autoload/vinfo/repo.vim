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



" create(path, doc) {{{1
" Create and split info plain text files of DOC in repo PATH
function! vinfo#repo#create(path, doc)
    let l:doc_path = a:path . '/' . a:doc . '/'
    let l:doc = l:doc_path . a:doc . '.txt'
    exe 'silent !mkdir ' . l:doc_path
    exe 'silent !info ' . a:doc . ' >> ' . l:doc
    exe 'silent !split -l 5000 -d ' . l:doc . ' ' . l:doc_path . a:doc
    exe 'silent !rm ' . l:doc
    exe 'redraw!'
endfunction
" }}}1



" clean(path) {{{1
" Clean all docs in repo PATH
function! vinfo#repo#clean(path)
    exe 'silent !rm -rf ' . a:path . '/*'
    exe 'redraw!'
endfunction
" }}}1
