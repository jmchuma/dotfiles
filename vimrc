" vimrc -> ~/.vimrc
" vim -> ~/.vim
"
" para que al hacer split, la nueva ventana se abra abajo
set splitbelow
" activa el reconocimiento de sintaxis
syntax on
" muestra el numero de lineas
set nu
" Para que muestre linea y col abajo a la izquierda
set ruler
" activa el resaltado de la linea actual. solo para vim7
" set cursorline
" guarda 20 lineas en la memoria de comando y 20 en la de busqueda
"set history=20
" busca texto a medida que lo insertas
set incsearch
"
" para deshacer el resaltado usar :noh
" si lo uso mucho plantearme poner esto
" Press Space to turn off highlighting and clear any message already displayed.
:noremap <silent> <Space> :silent noh<Bar>echo<CR>
set hlsearch
"
set autoindent
" hacer luego help statusline para ver que es cada cosa
set statusline='%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [LEN=%L]'
set laststatus=2
"set autochdir             " change the current working directory
set autoread              " read open files again when changed outside Vim
set autowrite             " write a modified buffer on each :next , ...
set browsedir  =current   " which directory to use for the file browser
set incsearch             " use incremental search
set nowrap                " do not wrap lines
set visualbell            " visual bell instead of beeping
" TABS STUFF
" TODO set indent style per language
"set shiftwidth =4         " number of spaces to use for each step of indent
set tabstop=4         " number of spaces that a <Tab> in the file counts for
"set expandtab
"set smarttab
set title " set window title
set cursorline " highlight line of cursor
set showmatch " match opening and closing punctuation together


"set shiftwidth=2
" mirar www.stripey.com/vim/vimrc.html y www.vi-improved.org/vimrc.php
"set shiftround
"set smartindent
"set nocompatible
" para que use colores que queden bien en fondo oscuro
set background=dark
" para mejora el esquema de colores
"colorscheme candycode
"colorscheme desertEx
"colorscheme kib_darktango
"colorscheme rdark
"colorscheme anotherdark
"colorscheme slate2
"colorscheme tango
colorscheme gotan

