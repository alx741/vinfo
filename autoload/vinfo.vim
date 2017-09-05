" =============================================================================
" File: vinfo.vim
" Description: Info docs loading and creation, buffer creation
" Author: Daniel Campoverde Carrión [alx741] <alx741@riseup.net>
" =============================================================================


let s:vinfo_autoload_path = expand('<sfile>:p:h')
let s:vinfo_repo_path = fnamemodify(s:vinfo_autoload_path . '/../plugin/vinfo_doc_repo', ':p:h')
let s:vinfo_current_doc = ""
let s:vinfo_current_page = 0
let s:vinfo_current_doc_pages = 0



" load_doc(doc) {{{1
" Load help-files for DOC info doc or create it if it doesn't exist
function! vinfo#load_doc(doc)
    let exist = vinfo#repo#exists(s:vinfo_repo_path, a:doc)
    let doc_files = split(globpath(s:vinfo_repo_path . '/' . a:doc, '*'), '\n')
    let s:vinfo_current_doc = a:doc
    let s:vinfo_current_page = 0
    let s:vinfo_current_doc_pages = len(doc_files)

    " Repo exists
    if exist
        call vinfo#show(a:doc, 0)

    " Repo does not exists (create it)
    else
        let created_repo = vinfo#repo#create(s:vinfo_repo_path, a:doc)

        " Repo creation failed
        if created_repo ==? 0
            echoe '[Vinfo] Invalid DOC: ' . a:doc . '  (No repo created)'
            let s:vinfo_current_doc = ''
            let s:vinfo_current_page = 0
            let s:vinfo_current_doc_pages = 0
            exe 'redraw!'
            return 0
        endif

        " Convert repo files to vim-help files
        let doc_files = split(globpath(s:vinfo_repo_path . '/' . a:doc, '*'), '\n')
        for doc_file in doc_files
            exe 'edit ' . doc_file
            call vinfo#conversion#info2help()
            write!
            exe 'silent bdelete!'
            " Write appropriate modeline options in repo files
            exe 'silent ! echo "vim:ft=help bt=nowrite bufhidden=delete readonly nomodifiable nobuflisted:" >> ' . doc_file
        endfor

        " Create tags file for repo
        exe 'helptags ' . s:vinfo_repo_path . '/' . a:doc . '/'
        call vinfo#show(a:doc, 0)
    endif
endfunction
" }}}1



" show(doc, page) {{{1
" Shos the DOC info doc in a new split window
function! vinfo#show(doc, page)
    " Convert page number to appropriate -two digits- format
    let page_number = ''
    if a:page <? 10
        let page_number = '0' . a:page
    endif

    split
    exe 'edit ' . s:vinfo_repo_path . '/' . a:doc . '/' . a:doc . page_number . '.txt'
    exe 'redraw!'
    exe 'norm gg'
endfunction
" }}}1



" clean_repo() {{{1
" vinfo#repo#clean(path) wrapper function
function! vinfo#clean_repo()
    call vinfo#repo#clean(s:vinfo_repo_path)
    echom "[Vinfo] Repository is now empty"
endfunction
" }}}1



" next_page() {{{1
function! vinfo#next_page()
    if s:vinfo_current_doc ==? ''
        return 0
    endif

    " Advance page number
    if s:vinfo_current_page+1 <? s:vinfo_current_doc_pages
        let s:vinfo_current_page+=1
    else
        echo '[Vinfo] No pages left for: ' . s:vinfo_current_doc
        return 0
    endif

    quit " Remove previous split
    call vinfo#show(s:vinfo_current_doc, s:vinfo_current_page)
endfunction
" }}}1



" previous_page() {{{1
function! vinfo#previous_page()
    if s:vinfo_current_doc ==? ''
        return 0
    endif

    " Advance page number
    if s:vinfo_current_page-1 >=? 0
        let s:vinfo_current_page-=1
    else
        echo '[Vinfo] Currently at the first page of: ' . s:vinfo_current_doc
        return 0
    endif

    quit " Remove previous split
    call vinfo#show(s:vinfo_current_doc, s:vinfo_current_page)
endfunction
" }}}1
