
syntax on
set encoding=utf-8
set visualbell             " visual bell instead of beeping


" UI -------------------------------------------------------------------------

set title
set background=dark
if filereadable(expand("~/.vim/colors/gotan.vim"))
    colorscheme gotan
endif

" Visual aids

set cursorline             " highlight line of cursor
set nu                     " show line nubers
set ruler                  " show current line and colum number
set showmatch              " match opening and closing punctuation together
set statusline='%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [LEN=%L]'
                           " hacer luego help statusline para ver que es cada cosa
set laststatus=2


" --------------------------------------------------------

"set autochdir             " change the current working directory
set autoread               " read open files again when changed outside Vim
set autowrite              " write a modified buffer on each :next , ...
set browsedir  =current    " which directory to use for the file browser
set nowrap                 " do not wrap lines
set nojoinspaces           " Use only one space after period when joining lines
set splitbelow
set splitright
" guarda 20 lineas en la memoria de comando y 20 en la de busqueda
"set history=20


" Indenting ------------------------------------------------------------------

" TODO set indent style per language
"set shiftwidth =4          " number of spaces to use for each step of indent
set tabstop=4              " number of spaces that a <Tab> in the file counts for
"set expandtab
"set smarttab
set autoindent
" mirar www.stripey.com/vim/vimrc.html y www.vi-improved.org/vimrc.php
"set shiftround
"set smartindent
"set nocompatible


" Searching -------------------------------------------------------------------

set hlsearch               " highlight search matches
set incsearch              " incremental search

