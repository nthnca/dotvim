" vim: set ft=vim:

" I want to use vim, not vi.
set nocompatible

syntax on
"set mouse=a
set notitle


" Dealing with spaces vs tabs.
"""" May want to try :retab ???
set expandtab      "inserts spaces not tabs, use CTRL-V<Tab> for real tab.
set softtabstop=2  "number of spaces to use for tab,
                   "also pretends like tabs are being used when <BS> is used.
set autoindent     "copy indent from previous line. cindent overrides this.
set shiftwidth=2   "number of spaces to use for autoindentation
set backspace=2    ""help 'backspace'"

set history=100
set viminfo='20,<50  "save state in ~/.viminfo. help viminfo
" I should learn more about jumplist, changelist
" buffers
" input-line history
" file marks

" Miscellaneous other stuff.
set laststatus=2     "always want a status line.
"set backup           "don't really care about this, but why not..
set textwidth=79     "80 is just overkill.
set visualbell t_vb= "just flash the screen
set showmatch        "match brackets when inserting
set scrolloff=3  "keep some lines visible when scrolling to top or bottom
set autowrite    "automatically write the file out when following tags, etc.
set formatoptions=tcq2r  "for more information use :help fo-table
set ruler
set noswapfile

" Definately want modeline turned on.
set modeline
set modelines=3

set expandtab
set shiftwidth=2
set softtabstop=2

set hlsearch

" Bash style completion for filenames.
set wildmode=longest,list
set wildignore+=*.o,*~,*.tmp,*.pyc

" Miscellaneous other stuff.
set laststatus=2     "always want a status line.

set nohid        "google vim rc turns on hidden, turn it back off.
set autowrite    "automatically write the file out when following tags, etc.


" Trying using a comma, or is there a better character?
let mapleader = ","

" Make it simple to modify and update my vimrc file.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Instead of going to ex mode, Q will format paragraph like gq.
nnoremap Q gqap
vnoremap Q gq

nnoremap <unique> m :cn<CR>
nnoremap <unique> M :cp<CR>
nnoremap <unique> <C-n> :tn<CR>

" It is soooo nice not to have to hit shift.
nnoremap ; :

" Configure a 'Comments' command to import CL code review comments into the
" quickfix buffer.
command! Tags cexpr system('tags')


" Probably don't want this now that I am using cindent
" set smartindent
" set hidden
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

" Reminders....
" Insert mode: I, i, A, O, o

" Re-source the vimrc file you are editing.
" :so %

