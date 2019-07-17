" vim: set ft=vim:

" I want to use vim, not vi
set nocompatible

" Turn modeline on, maybe a security risk
set modeline
set modelines=3

" This is growing on me...
set autochdir

" Formatting - Spaces vs tabs, backspaces, and encoding
" May want to try :retab ???
set expandtab      " Inserts spaces not tabs, use CTRL-V<Tab> for real tab
set tabstop=8      " Make real tabs massive, so it's clear when they are there
set shiftwidth=2   " Number of spaces to use for autoindentation
set softtabstop=2
set autoindent     " Copy indent from current line
set backspace=indent,eol,start  " :help 'backspace'
set encoding=utf-8

" Bash style completion for filenames
set wildmenu
set wildmode=longest,list
set wildignore+=*.o,*~,*.tmp,*.pyc,*.pb.*

" GUI, drawing of the screen
set laststatus=2      " Always want a status line
set scrolloff=3       " Keep lines visible when scrolling to top or bottom
set visualbell t_vb=  " Just flash the screen
set showmode
set showcmd
set ruler
set notitle
" set relativenumber
" set cursorline

" Configure search
" set ignorecase  " ignorecase and smartcase may be even better
set gdefault
" set showmatch   " Match brackets when inserting
set hlsearch
set incsearch

" Deal with files and buffers
set autowrite   " Automatically write file out when following tags, etc
set nohid       " Make sure hidden is turned off
set noswapfile

" History and state
set history=100
set viminfo='20,<50  " Save state in ~/.viminfo. help viminfo

" Formatting
set textwidth=89   " Wrap at 79 - 80 is just overkill
set formatoptions=tcq2r  " For more information use :help fo-table
set colorcolumn=90
set wrap

set tags=./tags;

hi Search ctermbg=white ctermfg=black

" Trying using a comma, or is there a better character?
let mapleader = ","

" Make it simple to modify and update my vimrc file
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" It is soooo nice not to have to hit shift
nnoremap ; :

" Awesome escape
inoremap kj <Esc>

" Force me to stop using those nasty arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Switch which window has focus and window order
nnoremap <C-W> <C-W><C-W>
nnoremap <leader>r <C-W><C-R>
nnoremap <leader>t f)T(vt)<C-]>

" Instead of going to ex mode, Q will format paragraph like gq
nnoremap Q gqap
vnoremap Q gq

nnoremap <unique> m :cn<CR>
nnoremap <unique> M :cp<CR>
nnoremap <unique> <C-n> :tn<CR>

nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
inoremap <esc> <nop>


" Configure a 'Comments' command to import CL code review comments into the
" quickfix buffer
command! Tags cexpr system('tags')

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    v/\_s*\S/d
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Remove ALL autocommands for the current group
autocmd!
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd FocusLost,CursorHold,CursorHoldI * :wa

function! <SID>FormatOnSaveCpp()
    " Preparation: save last search, and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    silent %!clang-format --style=llvm
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call <SID>FormatOnSaveCpp()

syntax on

" Settings for vim-go
let g:go_fmt_command = "goimports"

" CtrlP setting: Always use CWD
let g:ctrlp_working_path_mode = 'w'

execute pathogen#infect()

" LOTS OF RANDOM STUFF, ALL COMMENTED OUT

" I should learn more about jumplist, changelist
" buffers
" input-line history
" file marks
" set backup           "don't really care about this, but why not

" Probably don't want this now that I am using cindent
" set smartindent
" set nojoinspaces
" supposedly handy for :make. Still deciding what setting I like here
" set cmdheight=2 "handy for :make


" search for > 80 character lines
" nmap <unique> <Leader>8 /\%>81v<CR>

" search for trailing spaces/tabs
" nmap <unique> <Leader>9 /[ \t]\+$<CR>

" bk edit the current file
" map <Leader>edit :!bk edit %:p<CR>

" cd to current file's directory
" map <Leader>cd :cd %:p:h<CR>

" Reminders...
" Insert mode: I, i, A, O, o

" Re-source the vimrc file you are editing
" :so %
