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
Bundle 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required  
"}}}

" Colors {{{
set background=dark
colorscheme solarized         " awesome colorscheme
syntax enable     
" }}} 

" Spaces & Tabs {{{
set tabstop=4                            " number of visual spaces per TAB
set softtabstop=4                        " number of spaces in tab when editing
set shiftwidth=4                         " key < has 4 spaces
set expandtab                            " tabs are spaces
" }}}

" UI Config {{{
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
set backupdir=~/.vim/backup//   " tell vim where to put its backup files
set dir=~/.vim/swap//           " tell vim where to put swap files
" }}}

" Keybinding functions {{{
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left>
" }}}

" Plugins  config {{{
set pastetoggle=<F2>
map <F2> :NERDTreeToggle<cr>
" }}}

