runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

Helptags

set t_Co=256 " tell vim we have 256 colors

set nocompatible " vi sucks

" enable indent guides
autocmd VimEnter * :IndentGuidesEnable

" Powerline
set laststatus=2 " show status line
set encoding=utf-8 " good and necesarry for fancy characters in status line

" easy tabbing
imap <S-Tab> <C-d>
vmap <Tab> >gv
vmap <S-Tab> <gv

" programmers are so fucking particular about tabs
filetype plugin indent on
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

set showcmd "showcmd as typing

set hlsearch
set showmatch
set vb t_vb=
set ruler
set incsearch
set number
set ignorecase

syntax on
colorscheme desert

" == back up, but don't keep it in the same dir as the god damn files 
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set clipboard=unnamed

" fix for crontab -e on mac
set backupskip=/tmp/*,/private/tmp/*  

" Shift W, W -> Save
map <S-W><S-W> :w<CR>

set viminfo='10,\"100,:20,%,n~/.viminfo

" == cursor restore ===
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" relative numbering normally, absolute when defocused or insert mode
set rnu
au InsertEnter * :set nu
au InsertLeave * :set rnu
au FocusLost * :set nu
au FocusGained * :set rnu

" nerd tree options
autocmd vimenter * if !argc() | NERDTree | endif " auto-load if no files were specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close vim if only window left open is nerd tree

" == hide toolbar ==
if has("gui_running")
    set guioptions=egmrt
endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
