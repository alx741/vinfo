" =============================================================================
" File: repo.vim
" Description: Create new help files for the repository, verify repo existences
" Author: Daniel Campoverde [alx741] <alx741@riseup.net>
" =============================================================================


" exists(path, doc) {{{1
" Returns TRUE if DOC exists in repo PATH
function! vinfo#repo#exists(path, doc)
    let l:dirs = split(globpath(a:path, '*'), '\n')

    for l:dir in l:dirs
        let l:doc_dir = a:path . '/' . a:doc
        if l:dir ==? l:doc_dir
            return 1
        endif
    endfor

    return 0
endfunction
" }}}1



" create(path, doc) {{{1
" Create and split info plain text files of DOC in repo PATH
" Returns TRUE if success
function! vinfo#repo#create(path, doc)
    echom '[Vinfo] Creating repo for: ' . a:doc
    let l:doc_path = a:path . '/' . a:doc . '/'
    let l:doc = l:doc_path . a:doc . '.txt'
    exe 'silent !mkdir ' . l:doc_path
    exe 'silent !info ' . a:doc . ' >> ' . l:doc
    exe 'silent !split -l 5000 -d --additional-suffix .txt ' . l:doc . ' ' . l:doc_path . a:doc
    exe 'silent !rm ' . l:doc
    exe 'redraw!'

    " If DOC is not a valid Info file, none file will be created
    let l:doc_files = split(globpath(l:doc_path, '*'), '\n')
    if len(l:doc_files) ==? 0
        exe 'silent !rmdir ' . l:doc_path
        return 0
    endif

    return 1
endfunction
" }}}1



" clean(path) {{{1
" Clean all docs in repo PATH
function! vinfo#repo#clean(path)
    echom '[Vinfo] Cleaning repository'
    exe 'silent !rm -rf ' . a:path . '/*'
    exe 'redraw!'
endfunction
" }}}1
