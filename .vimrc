set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
  "Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
" Git plugin not hosted on GitHub
  "Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
  "Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'ajgrf/parchment'
Plugin 'dense-analysis/ale'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on



" Put your non-Plugin stuff after this line
set shell=bash
set number
set mouse=a
set splitright


" these don't work unless run after entry to editor
"probably overriden by colorscheme
hi Normal ctermfg=black ctermbg=255 cterm=NONE
hi Comment ctermfg=red ctermbg=NONE cterm=NONE
hi Function ctermfg=black

"is applied ok when done manually, not from here though.
set termguicolors
colorscheme parchment