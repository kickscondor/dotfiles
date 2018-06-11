set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bling/vim-bufferline'
" Plugin 'AlessandroYorba/Alduin'
Plugin 'w0ng/vim-hybrid'

call vundle#end()            " required
filetype plugin indent on    " required

" General
set backspace=2           " enable <BS> for everything
set colorcolumn=80        " visual indicator of column
set completeopt-=preview  " dont show preview window
set fcs=vert:¦,fold:-     " solid instead of broken line for vert splits
set grepprg=grep\ -nH\ $* " always generate a filename, for vim-latexsuite
set hidden                " hide when switching buffers, don't unload
set laststatus=2          " always show status line
set lazyredraw            " don't update screen when executing macros
set modeline              " use source code header settings
" set mouse=a               " enable mouse in all modes
set noshowmode            " don't show mode, since I'm already using powerline
set nowrap                " disable word wrap
set showcmd               " show command on last line of screen
set showmatch             " show bracket matches
set spelllang=en_us       " spell check with U.S. English
set spellfile=~/.vim/spell/en.utf-8.add
set textwidth=0           " don't break lines after some maximum width
set ttyfast               " increase chars sent to screen for redrawing
"set ttyscroll=3           " limit lines to scroll to speed up display
set title                 " use filename in window title
set wildmenu              " enhanced cmd line completion

" Folding
set foldignore=           " don't ignore anything when folding
set foldlevelstart=99     " no folds closed on open
set foldmethod=marker     " collapse code using markers
set foldnestmax=1         " limit max folds for indent and syntax methods

" Searches
set hlsearch              " highlight search results
set incsearch             " search whilst typing
map <Leader>/ :nohlsearch<CR> " use \/ to cancel a search

" Airline
let g:tmuxline_preset = {
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W'],
  \'z'    : '#H'}
let g:airline_theme='alduin'
let g:airline_powerline_fonts = 1

" Advanced terminal
set t_Co=256
set termencoding=utf-8

" Custom file types
autocmd BufNewFile,BufRead *.g set filetype=yacc

" screen-safe titling
if &term == "screen"
  autocmd BufEnter * let &titlestring = "vim:" . expand("%")
  set t_ts=k
  set t_fs=\
  set title
endif

" wmii-style windowing
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <S-J> :bn<CR>
map <S-K> :bp<CR>
set wmh=0

" colors
set background=dark
colorscheme hybrid
syntax on
