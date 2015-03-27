" =============================================================================
" File: vinfo.vim
" Description: Info docs loading and creation, buffer creation
" Author: Daniel Campoverde Carrión [alx741] <alx741@riseup.net>
" =============================================================================


let s:vinfo_autoload_path = expand('<sfile>:p:h')
let s:vinfo_repo_path = fnamemodify(s:vinfo_autoload_path . '/../plugin/vinfo_doc_repo', ':p:h')



" load_doc(doc) {{{1
" Load help-files for DOC info doc or create it if it doesn't exist
function! vinfo#load_doc(doc)
    let exist = vinfo#repo#exists(s:vinfo_repo_path, a:doc)

    " Repo exists
    if exist
        call vinfo#show(a:doc)

    " Repo does not exists (create it)
    else
        let created_repo = vinfo#repo#create(s:vinfo_repo_path, a:doc)

        " Repo creation failed
        if created_repo ==? 0
            echom '[Vinfo] Invalid DOC: ' . a:doc . '  (No repo created)'
            exe 'redraw!'
            return 0
        endif

        let doc_files = split(globpath(s:vinfo_repo_path . '/' . a:doc, '*'), '\n')
        for doc_file in doc_files
            exe 'edit ' . doc_file
            call vinfo#conversion#info2help()
            write!
            exe 'silent bdelete!'
            " Write appropriate options
            exe 'silent ! echo "vim:ft=help bt=nowrite bufhidden=delete readonly nomodifiable nobuflisted:" >> ' . doc_file
        endfor
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
    exe 'redraw!'
endfunction
" }}}1



" clean_repo() {{{1
" vinfo#repo#clean(path) wrapper function
function! vinfo#clean_repo()
    call vinfo#repo#clean(s:vinfo_repo_path)
endfunction
" }}}1
