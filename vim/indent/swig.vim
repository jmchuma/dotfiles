" Vim indent file
" Language:	SWIG
" Maintainer:	Amit G Mendapara <mendapara.amit@gmail.com>
" Last Change:	2006 Jun 11

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" C++ indenting is built-in, thus this is very simple
setlocal cindent
