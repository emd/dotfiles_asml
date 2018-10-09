"==============================
" Package Management via Vundle
"==============================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" wombat256 color scheme
Plugin 'vim-scripts/wombat256.vim'

" Efficient, simple python folding
Plugin 'tmhedberg/SimpylFold'
" let g:SimpylFold_docstring_preview = 0
nnoremap f za

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"========================
" Additional Vim settings
"========================
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Mouse and backspace
set mouse=a
set bs=2    " make backspace behave like normal again

" Rebind <Leader> key
" It is easier to reach than the default leader key (i.e. backslash) and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Quickly exit insert mode
inoremap jj <Esc>

" Quick save command
noremap <Leader>s :update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :quit!<CR> " Force quit current window

" Easy movement between windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Easy movement between tabs
map <Leader>t <esc>:tabnew<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Easy movement of code blocks
" (i.e. go into visual mode (v),
" then select several lines of code, and
" then press ``>`` several times).
vnoremap < <gv
vnoremap > >gv

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Showing line numbers and length
set number " show line numbers
set ruler  " show cursor line number (and %) and column number
set tw=79  " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
if exists("&colorcolumn")
    set colorcolumn=80
endif
highlight ColorColumn ctermbg=233

" Show whitespace
" (MUST be inserted BEFORE the colorscheme command)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Color scheme
set t_Co=256
colorscheme wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" History settings
set history=1000
set undolevels=1000

" Spell checking
set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell
