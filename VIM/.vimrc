" vim: foldmethod=marker:foldlevel=0

"  Vundle {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set nocompatible
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ap/vim-css-color'
Plugin 'taglist.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
"}}}

" Colors {{{
set background=dark
colorscheme solarized         " awesome colorscheme
syntax enable
" }}}

" Spac es & Tabs {{{
set tabstop=4                            " number of visual spaces per TAB
set softtabstop=4                        " number of spaces in tab when editing
set shiftwidth=4                         " key < has 4 spaces
set expandtab                            " tabs are spaces
" }}}

" UI  Config {{{
set term=xterm-256color
set number                               " show line numbers
set wildmenu                             " visual autocomplete for command menu
set lazyredraw                           " redraw only when we need to.
set showmatch                            " highlight matching [{()}]
set mouse=a                              " mouse in interactive mode
set clipboard=unnamedplus                " vim clipboard are sync with the system clipboard
let mapleader = ","
 " }}}

" Searching {{{
set ignorecase                           " search are not case sensitive
set incsearch                            " search as characters are entered
set hlsearch                             " highlight matches
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight (leader = \)
" }}}

" Foldin {{{
set foldenable          " enable folding
set foldmethod=indent   " fold based on indent level
nnoremap <space> za     " fold/unflold by pressing space
set foldlevel=99        " fold are always open
" }}}

" Backup & Swap files {{{
set backup                      " tell vim to keep a backup file
set backupdir=~/.cache/vim/backup//   " tell vim where to put its backup files
set dir=~/.cache/vim/swap//           " tell vim where to put swap files
"  }}}

" Keybinding functions {{{
" Replace function
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"fix zsh, tmux vim -- home end keys
"Normal mode key map
"go to beginning of line
map  g^
"go to end of line
map  g$

" Insert mode key map
"go to beginning of line
imap  <HOME>
"go to end of line
imap  <END>

"CtrlP buffer
nmap <leader>p :CtrlPBuffer<cr>

"Buffers
nmap <tab> :bnext<cr>

vmap <Tab> >
vmap <S-Tab> <

"  }}}

" Plugins config {{{
set pastetoggle=<F2>
map <F2> :NERDTreeToggle<cr>
 " }}}

" AirLine {{{
set hidden "Allow to change buffer without save
"Enable airline tabline
" let g:airline#extensions#tabline#enabled = 1
" use patchet fonts that can use >
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_theme='base16'
let g:airline#extensions#syntastic#enabled = 1

 " }}}


set tags=tags;$HOME
set wildignore+=*.swp,*.bak,*.pyc,*.cache,*.o,*.d,tags,cscope.*
map <F6> :exec("tag ".expand("<cword>"))<CR>
map <F3> :%s/\s\+$//e 

