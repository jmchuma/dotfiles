" Vim syntax file
" Language:	SWIG
" Maintainer:	Amit G Mendapara <mr_amit@users.sourceforge.net>
" Last Change:	June 10, 2006
" Version:	1
" URL:	-

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C++ syntax to start with
if version >= 600
  runtime! syntax/cpp.vim
else
  so <sfile>:p:h/cpp.vim
endif
unlet b:current_syntax

" load java syntax
syn include @swigJava if version >=600 syntax/java.vim else <sfile>:p:h/java.vim endif
syn region swigJavaCode matchgroup=swigJava start=/^BEGIN_JAVA.*$/ end=/^END_JAVA.*$/ contains=@swigJava
unlet b:current_syntax

" SWIG block XXX: cuases problems
"syn region swigBlock matchgroup=swigDirective start="%{" end="%}" contains=ALL

syn match   swigBlockParen      "%{\|%}"
syn match	swigDirective		"%\w\+"
syn match   swigPlaceHolder     "%\?\$\w\+"

hi link swigBlockParen	Keyword
hi link swigDirective	Keyword
hi link swigPlaceHolder	SpecialChar

hi swigJava gui=bold

let b:current_syntax = "swig"

" vim: ts=4

