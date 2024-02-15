set nocompatible              " be iMproved, required

call plug#begin()
" default Plug directory ~/.vim/plugged

Plug 'ajgrf/parchment'
" works with lsp server-backed Plugs like pyright:
" let g:ale_completion_enabled = 1
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' "git
Plug 'tpope/vim-repeat' "makes repeat(.) register plugin keymaps
Plug 'junegunn/fzf'
Plug 'leafOfTree/vim-matchtag'

call plug#end()

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

"also check vim-unimpaired
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
