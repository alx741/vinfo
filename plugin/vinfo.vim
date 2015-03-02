" =============================================================================
" File: vinfo.vim
" Description: Define user commands :Vinfo, :VinfoClean
" Author: Daniel Campoverde [alx741] <alx741@riseup.net>
" =============================================================================



command! -nargs=1 -complete=shellcmd Vinfo call vinfo#load_doc(<f-args>)
command! VinfoClean call vinfo#clean_repo()
