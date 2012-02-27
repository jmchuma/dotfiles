"
" Languaje: Stringtemplate
" Mantainer: Jose Maria Chumo Mata <jmchuma@gmail.com> 
" Last Change: 11 Sept 2009
" Version: 0.1
"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'stg'
endif

" KEYWORDS
syn keyword stgKeys group
syn match   stgCond +<\(else\|endif\)>+
"syn match ifCond +[.^\(if\|(|)\)]*+ contained
"syn match   stgCond +<if(.*)>+ contains=ifCond
syn region  ifCond start=+(+ end=+)+ contained transparent
syn region  stgIf matchgroup=stgIf start=+<if(+ end=+)>+ contains=ifCond
syn region  stgIf matchgroup=stgIf start=+<elseif(+ end=+)>+ contains=ifCond

syn match  stgComment "//.*$"

syn match  templateDelim1 "::=\s*<<"
syn match  templateDelim1 ">>"

syn match  templateDelim2 "::=\s*\""
syn match  templateDelim2 "\""

"syn region templateAction start=+::=\s*<<+ end=+>>+ contains=templateVar,templateComment
"THIS IS THE GOOD ONE
"syn region templateAction start=+^\s*\([a-zA-Z][A-Za-z0-9_$]*\)\s*(\s*\([a-zA-Z][A-Za-z0-9_$]*\)\(\s*,[a-zA-Z][A-Za-z0-9_$]*\)\s*)\s*::=\s\*<<+ end=/>>/ contains=templateVar,templateComment

syn match templateVar "<^else([a-zA-Z_0-9]\+)>"


" Higlighting rueles
if version >= 508 || !exists("did_stg_syn_inits")
  if version < 508
    let did_stg_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink    stgKeys             Keyword
  HiLink    templateDelim1      Operator
  HiLink    templateDelim2      Operator
  HiLink    stgComment          Comment
"  HiLink    template           Type
  HiLink    templateVar         Identifier
  HiLink    stgCond             Conditional
  HiLink    stgIf             Conditional
  delcommand HiLink
endif

let b:current_syntax = "stg"
if main_syntax == 'stg'
  unlet main_syntax
endif

