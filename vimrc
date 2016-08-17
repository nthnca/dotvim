" vim: set ft=vim:

" Reminders....
" Insert mode: I, i, A, O, o

" Re-source the vimrc file you are editing.
" :so %

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

" search for > 80 character lines
nmap <unique> <Leader>8 /\%>81v<CR>

" search for trailing spaces/tabs
nmap <unique> <Leader>9 /[ \t]\+$<CR>

" bk edit the current file
map <Leader>edit :!bk edit %:p<CR>

" cd to current file's directory
map <Leader>cd :cd %:p:h<CR>


" instead of going to ex mode, Q will format paragraph like gq
nnoremap Q gqap
vnoremap Q gq


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

nmap <unique> m :cn<CR>
nmap <unique> M :cp<CR>
nmap <unique> <C-n> :tn<CR>

" It is soooo nice not to have to hit shift.
nmap ; :

set nohid        "google vim rc turns on hidden, turn it back off.
set autowrite    "automatically write the file out when following tags, etc.

" Configure a 'Comments' command to import CL code review comments into the
" quickfix buffer.
command! Tags cexpr system('tags')

" Configure the markdown syntax handling
let g:vim_markdown_folding_disabled=1
set nofoldenable
let g:vim_markdown_frontmatter=1

" autocommands are run automatically whenever a file of the given type is
" referenced (they can also have other triggers)
if has("autocmd") "Prevent old vi versions from complaining
  " Use the C indentation package for programs
  au BufEnter *.java,*.c,*.C,*.cpp,*.h,*.H,*.cc,*.py  set
     \ cindent sw=2 sts=2 cinoptions=(0,u0,U1

  " Use the python menu where appropriate
"  au FileType python source ~/.vim/occasional/python.vim

  " Use syntax folds for xml files
  au FileType xml set foldmethod=syntax

  " do tabbing properly in Makefiles
  au BufEnter Makefile* set sts=8 noexpandtab

  " don't use incremental search in large trace files
  au BufEnter *trace* set noincsearch

  " use the makeDot script for dot files
  au BufEnter *.dot set makeprg=makeDot\ %

  " auto-break lines when editing a latex file, and set appropriate ":make" prg
  au BufEnter *.tex set textwidth=79 makeprg=mklatex\ %

  au BufEnter *.txt set textwidth=76 formatoptions=tcqn1
    \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

  au BufNewFile,BufRead *.email,/tmp/mutt*  set nohlsearch tw=74 list
  au BufNewFile,BufRead *.email,/tmp/mutt*  set listchars=trail:. comments=nb:>
  au BufNewFile,BufRead *.email,/tmp/mutt*  set formatoptions=tcqn1 ft=mail
  au BufNewFile,BufRead *.email,/tmp/mutt*  set spell

  au BufEnter /tmp/issueNotes* set filetype=html
  
  au BufEnter */dmg.html set filetype=txt

  au BufEnter */todo.txt set filetype=todo
endif

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END


" Probably don't want this now that I am using cindent
" set smartindent
" set hidden
" set nojoinspaces
" supposedly handy for :make. Still deciding what setting I like here
" set cmdheight=2 "handy for :make
