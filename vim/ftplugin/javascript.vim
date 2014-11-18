" Only do this when not done yet for this buffer
if exists("b:js_ftplugin")
    finish
endif
let b:js_ftplugin = 1

setlocal autoindent
setlocal colorcolumn=80
setlocal expandtab
setlocal shiftwidth=4
setlocal smartindent
setlocal smarttab
setlocal softtabstop=4
setlocal textwidth=80
