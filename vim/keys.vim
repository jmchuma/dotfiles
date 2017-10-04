" Press Space to turn off highlighting and clear any message already displayed.
:noremap <silent> <Space> :silent noh<Bar>echo<CR>
"On the mac, this allows me to use j, k, $, 0 and ^ on display lines by
"holding down the command key.
"vmap <D-j> gj
"vmap <D-k> gk
"vmap <D-4> g$
"vmap <D-6> g^
"vmap <D-0> g^
"nmap <D-j> gj
"nmap <D-k> gk
"nmap <D-4> g$
"nmap <D-6> g^
"nmap <D-0> g^
"
"http://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
" delete without yanking
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d
"
" " replace currently selected text with default register
" " without yanking it
" vnoremap <leader>p "_dP
"
" is the ' blackhole register', according to :help "_
