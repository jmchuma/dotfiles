"
" Languaje: Jasmin
" Mantainer: Jose Maria Chumo Mata <jmchuma@gmail.com> 
" Last Change: 11 Sept 09
" Version: 0.1
"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'jasmin'
endif

syn   match     jasComment "^\s*;.*$"
syn   match     jasComment "\s\s*;.*$"

" KEYWORDS
"syn   keyword   jasType        B C D F I J S Z
syn   keyword   accessMods     public private protected static
syn   keyword   jasStatement   return
syn   match     jasKeys        /\.\(filed\|implements\|limit\|line\|source\|super\|var\)/
syn   match     jasKeys        /\.\(class\|end\|interface\|method\)/
syn   match     jasExcept      /\.\(catch\|throws\)/

syn   keyword   jasOps ret aload astore dload dstore fload fstore iload istore lload lstore

syn   keyword   jasOps bipush sipush iinc

syn   keyword   jasOps aaload aastore aconst_null aload_0 aload_1 aload_2 aload_3 areturn
syn   keyword   jasOps    arraylength astore_0 astore_1 astore_2 astore_3 athrow baload bastore breakpoint caload castore d2f d2i d2l dadd daload dastore dcmpg dcmpl dconst_0 dconst_1 ddiv dload_0 dload_1 dload_2 dload_3 dmul dneg drem dreturn dstore_0 dstore_1 dstore_2 dstore_3 dsub dup dup2 dup2_x1 dup2_x2 dup_x1 dup_x2 f2d f2i f2l fadd faload fastore fcmpg fcmpl fconst_0 fconst_1 fconst_2 fdiv fload_0 fload_1 fload_2 fload_3 fmul fneg frem freturn fstore_0 fstore_1 fstore_2 fstore_3 fsub i2d i2f i2l iadd iaload iand iastore iconst_0 iconst_1 iconst_2 iconst_3 iconst_4 iconst_5 iconst_m1 idiv iload_0 iload_1 iload_2 iload_3 imul ineg int2byte int2char int2short ior irem ireturn ishl ishr istore_0 istore_1 istore_2 istore_3 isub iushr ixor l2d l2f l2i ladd laload land lastore lcmp lconst_0 lconst_1 ldiv lload_0 lload_1 lload_2 lload_3 lmul lneg lor lrem lreturn lshl lshr lstore_0 lstore_1 lstore_2 lstore_3 lsub lushr lxor monitorenter monitorexit nop pop pop2 return saload sastore swap

syn   keyword   jasJump goto goto_w
syn   keyword   jasCond if_acmpeq if_acmpne if_icmpeq if_icmpge if_icmpgt if_icmple if_icmplt if_icmpne ifeq ifge ifgt ifle iflt ifne ifnonnull ifnull

syn   keyword   jasMethodCall   invokenonvirtual invokestatic invokevirtual invokeinterface
syn   keyword   jasFieldCall   getfield  getstatic putfield  putstatic
syn   keyword   jasWhat        stack locals method

"jsr jsr_w
"anewarray
"checkcast
"instanceof
"new
"newarray multianewarray
"ldc ldc_w 
"lookupswitch
"default
"tableswitch

"syn match   jasNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
"syn match   jasNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
"syn match   jasNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
"syn match   jasNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn match   jasNumber		 "\<\d\+\.\d*\|\.\d\+\|\d\+\>"

syn match   jasLabel    "^\s*[_$#a-zA-Z][_$#a-zA-Z0-9]*\s*:"

"syn region methodDec start=+^\s*\.method+ end=/^\s*\.end\s+method/ contains=javaCond,javaOps,jasComment,jasKeys
"syn region  javaString		start=+"+ end=+"+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
syn region  jasString		start=+"+ end=+"+ end=+$+

" Highlight rules
if version >= 508 || !exists("did_jasmin_syn_inits")
  if version < 508
    let did_jasmin_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink    jasComment         Comment
  HiLink    accessMods         StorageClass
  "HiLink    jasCond            Conditional
  HiLink    jasKeys            Keyword
  "HiLink    jasExcept          Exception
  "HiLink    jasOps             Operator
  "HiLink    jasOps             Operator
  HiLink    jasStatement       Statement
  HiLink    jasString          String
  HiLink   jasMethodCall   PreProc
  HiLink   jasFieldCall   PreProc
  HiLink   jasNumber  Number
  HiLink   jasWhat   Keyword
  HiLink   jasLabel   Label
  delcommand HiLink
endif

let b:current_syntax = "stg"
if main_syntax == 'stg'
  unlet main_syntax
endif

