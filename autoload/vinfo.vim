" =============================================================================
" File: vinfo.vim
" Description: Info docs loading and creation, buffer creation
" Author: Daniel Campoverde Carrión [alx741] <alx741@riseup.net>
" =============================================================================



let s:vinfo_repo_path = fnamemodify('./doc_repo', ':p:h')



" load_doc(doc) {{{1
" Load help-files for DOC info doc or create it if it doesn't exist
function! vinfo#load_doc(doc)
    let exist = vinfo#repo#exists(s:vinfo_repo_path, a:doc)
    if exist
        call vinfo#show(a:doc)
    else
        call vinfo#repo#create(s:vinfo_repo_path, a:doc)
        let doc_files = split(globpath(s:vinfo_repo_path . '/' . a:doc, '*'), '\n')
        let prev_buff = 0
        for doc_file in doc_files
            exe 'edit ' . doc_file
            call vinfo#conversion#info2help()
            write!
            if prev_buff != 0
                exe 'bdelete! ' . prev_buff
            endif
            let prev_buff = bufnr(bufname("%"))
            " Write appropriate options
            exe '! echo "vim:ft=help bt=nowrite bufhidden=delete readonly nomodifiable nobuflisted:" >> ' . doc_file
        endfor
        exe 'bdelete! ' . prev_buff
        " Create tags
        exe 'helptags ' . s:vinfo_repo_path . '/' . a:doc . '/'
        call vinfo#show(a:doc)
    endif
endfunction
" }}}1



" show(doc) {{{1
" Shos the DOC info doc in a new split window
function! vinfo#show(doc)
    split
    exe 'edit ' . s:vinfo_repo_path . '/' . a:doc . '/' . a:doc . '00.txt'
endfunction
" }}}1
