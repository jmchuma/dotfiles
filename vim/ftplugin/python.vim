" Only do this when not done yet for this buffer
if exists("b:py_ftplugin")
    finish
endif
let b:py_ftplugin = 1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
