"                                             
"            __                               
"    __  __ /\_\    ___ ___   _ __   ___      
"   /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\    
"   \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/    
"    \ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\   
"     \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/   
"                                             
"                                             
" MY VIMRC
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Vundle config -----------------------
" TO INSTALL VUNDLE----
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"----------------------
set nocompatible
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin'gmarik/Vundle.vim'

"  --- PUT PLUGINS HERE ---
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'b3niup/numbers.vim'
Plugin 'davidhalter/jedi-vim'
"    REQUIRED FOR JEDI:
"    python2-pylint python-pylint python-jedi python2-jedi
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'mcchrish/nnn.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
"Bundle 'jistr/vim-nerdtree-tabs'
"Plugin 'xuyuanp/nerdtree-git-plugin'
"Plugin 'scrooloose/nerdtree'
"Plugin 'rafi/awesome-vim-colorschemes'
"Plugin 'nightsense/vimspectr'
"Plugin 'sjl/gundo.vim'
"Plugin 'kien/ctrlp.vim'
" ------------------------
call vundle#end()
filetype plugin indent on
" -------------------------------------

"split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>w <C-W>-
nnoremap <leader>a <C-W>>
nnoremap <leader>s <C-W>+
nnoremap <leader>d <C-W><
nnoremap <leader>, :split<CR>
nnoremap <leader>. :vsplit<CR>

" Line numbering
set number

" syntax highlighting
syntax on
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" Vim theme & bottom infobar
let g:airline_theme='cool'
let g:airline_powerline_fonts=1

set encoding=utf-8
set ttyfast
set lazyredraw

" Tab contros remap -------------
nnoremap tn  :tabnew<Space>

nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>

nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>

" Misc configs --
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set cursorline
set tabstop=4
set showcmd
set list
colorscheme skylines
set splitbelow
set splitright
set wildmode=longest,list,full
set wildmenu
set showmatch
set incsearch
set hlsearch


" Set Marker character for whitespace ---
set listchars=tab:→\ ,nbsp:␣,trail:˙,eol:¬,extends:»,precedes:«
"set listchars=tab:▸\ ,eol:¬,space:˙
"----------------------------------------

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"JEDI ---------------
autocmd FileType python let g:jedi#auto_initialization = 1
let g:jedi#usages_command = "<C-j>"
let g:jedi#popup_on_dot = 1
let g:jedi#completions_enabled = 1

" -------------------

" Colors
hi Normal ctermbg=none
" ---------------

augroup configgroup
	autocmd!
	autocmd FileType python nnoremap <F5> <esc>:w<CR>:!%:p<CR>
	autocmd FileType python map ## ggi#!/usr/bin/env python3<CR><esc>
	autocmd FileType python map <leader>b iif __name__ == "__main__":<CR>
	autocmd FileType python map <leader>c I#<esc>
	autocmd FileType go nnoremap <F5> <esc>:w<CR>:GoRun<CR>
	autocmd FileType vim map <leader>c I"<esc>
augroup END

" Misc keybindings ------------------------------
" map <button(s) to be pressed> <thing to happen>
" <CR> = Enter

map <space> <Leader>
map :W :w<CR>
map :Q :q<CR>
map <CapsLock> <Esc>
"nnn settup ---
autocmd VimEnter * map <leader>n :vsplit<CR><C-W>r:Np<CR>

"Go shortcuts
map gb :GoBuild<CR>

"Cycle number schemes
map <silent> <Leader>r :call mappings#cycle_numbering()<CR>
"Reload vimrc
nnoremap <F6> :source ~/.vimrc<CR>

"Copy paste
":let @+=@*<CR>

vnoremap <leader>c "+Y
map <leader>p "+P
" -----------------------------------------------

" Cycling through buffers ------
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>
"-------------------------------


" Markdown Preview settings ---------------------
let vim_markdown_preview_toggle=2
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Chromium'
let vim_markdown_preview_use_xdg_open=1

