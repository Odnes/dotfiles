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

Plugin 'neovimhaskell/haskell-vim'
Plugin 'ajgrf/parchment'
" works with lsp server-backed plugins like pyright:
" let g:ale_completion_enabled = 1
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive' "git
Plugin 'tpope/vim-repeat' "makes repeat(.) register plugin keymaps
Plugin 'junegunn/fzf'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'relative': v:true, 'yoffset': 1.0, 'border': 'none' } }

:command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

" Put your non-Plugin stuff after this line
set shell=bash

set clipboard=unnamedplus
set number
set mouse=a
set splitright
set ignorecase
set magic "regex like grep; might be dfault anyway
au Filetype gitcommit setl spell textwidth=72
au FileType hamlet setl sw=2 sts=2 et "something to do with haskell frontend template files

" Tabs to spaces
set tabstop=4 shiftwidth=4 expandtab textwidth=80

" these don't work unless run after entry to editor
"probably overriden by colorscheme
"hi Normal ctermfg=black ctermbg=255 cterm=NONE
"hi Comment ctermfg=red ctermbg=NONE cterm=NONE
"hi Function ctermfg=black

"is applied ok when done manually, not from here though.
set termguicolors
colorscheme parchment

"nnoremap L $
"nnoremap H ^
"vnoremap L $
"vnoremap H ^
nnoremap ; :
nnoremap Y p
nnoremap x "_x
nnoremap <C-p> :FZF<cr>
nnoremap gb :ls<cr>:b<Space>

" <C-5>,C-7> respectively. View what keycodes they produce by
" Inputting them after <C-v> in insert mode.
nnoremap <C-]> :bprevious<cr>
nnoremap <C-_> :bnext<cr>
