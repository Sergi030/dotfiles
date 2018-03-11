" vim:foldmethod=marker:foldlevel=0

" Colors {{{
" colorscheme #badwolf         " awesome colorscheme
syntax enable     
" }}} 

" Spaces & Tabs {{{
set tabstop=4                            " number of visual spaces per TAB
set softtabstop=4                        " number of spaces in tab when editing
set expandtab                            " tabs are spaces
" }}}

" UI Config {{{
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
" }}}

" Backup & Swap files {{{
    set backup                      " tell vim to keep a backup file
    set backupdir=~/.vim/backup//   " tell vim where to put its backup files
    set dir=~/.vim/swap//           " tell vim where to put swap files

" }}}

" Keybinding functions {{{
vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/g<left><left> " on Visualmode pres ctrl+R to do a global replace
" }}}
