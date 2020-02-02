 "___  ________   ___  _________    ___      ___ ___  _____ ______      
"|\  \|\   ___  \|\  \|\___   ___\ |\  \    /  /|\  \|\   _ \  _   \    
"\ \  \ \  \\ \  \ \  \|___ \  \_| \ \  \  /  / | \  \ \  \\\__\ \  \   
" \ \  \ \  \\ \  \ \  \   \ \  \   \ \  \/  / / \ \  \ \  \\|__| \  \  
"  \ \  \ \  \\ \  \ \  \   \ \  \ __\ \    / /   \ \  \ \  \    \ \  \ 
"   \ \__\ \__\\ \__\ \__\   \ \__\\__\ \__/ /     \ \__\ \__\    \ \__\
"    \|__|\|__| \|__|\|__|    \|__\|__|\|__|/       \|__|\|__|     \|__|

"
"VUNDLE ---------------------------------------------------
set nocompatible               " be improved, required
filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required
Plugin 'VundleVim/Vundle.vim'  " required

" ===================
" my plugins here
" ===================
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'b3niup/numbers.vim'
Plugin 'davidhalter/jedi-vim'
"    REQUIRED FOR JEDI:
"    python2-pylint python-pylint python-jedi python2-jedi
Plugin 'ervandew/supertab'
"Plugin 'fatih/vim-go'
Plugin 'mcchrish/nnn.vim'
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'dense-analysis/ale'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'hdima/python-syntax'
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'OmniSharp/omnisharp-vim'
"Plugin 'kien/rainbow_parentheses.vim'
" ===================
" end of plugins
" ===================
call vundle#end()               " required
filetype plugin indent on       " required
"----------------------------------------------------------

"split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>w <C-W>-
nnoremap <leader>a <C-W>>
nnoremap <leader>s <C-W>+
nnoremap <leader>d <C-W><
nnoremap <leader>. :split<CR>
nnoremap <leader>, :vsplit<CR>

" Line numbering ------------------------------------------
set number

" syntax highlighting -------------------------------------
syntax on
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

" Vim theme & bottom infobar ------------------------------
let g:airline_theme='cool'
let g:airline_powerline_fonts=1

set encoding=utf-8
set ttyfast
set lazyredraw

" Tab contros remap ---------------------------------------
nnoremap tn  :tabnew<Space>

nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>

nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>

" Powerline font mode -------------------------------------
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Various settings ----------------------------------------
set cursorline
set tabstop=4
set showcmd
set list
set splitbelow
set splitright
set wildmode=longest,list,full
set wildmenu
set showmatch
set incsearch
set hlsearch


" Set Marker character for whitespace ---------------------
set listchars=tab:⎟\ ,nbsp:␣,trail:˙,eol:¬,extends:»,precedes:«

" move vertically by visual line --------------------------
nnoremap j gj
nnoremap k gk

"JEDI -----------------------------------------------------
autocmd FileType python let g:jedi#auto_initialization = 1
let g:jedi#usages_command = "<C-j>"
let g:jedi#popup_on_dot = 1
let g:jedi#completions_enabled = 1

" Colors --------------------------------------------------
hi Normal ctermbg=none

" Custom shortcuts ----------------------------------------
augroup configgroup
	autocmd!
	autocmd FileType python nnoremap <F5> <esc>:w<CR>:!%:p<CR>
	autocmd FileType python map ## ggi#!/usr/bin/env python3<CR><esc>
	autocmd FileType python map <leader>i iif __name__ == "__main__":<CR>
	autocmd FileType python map <leader>c I#<esc>j
	autocmd FileType go nnoremap <F5> <esc>:w<CR>:GoRun<CR>
	autocmd FileType vim map <leader>c I"<esc>j<esc>
augroup END

nnoremap <leader>b :buffers<CR>:buffer<space>

noremap <leader>y "+y
noremap <leader>p "+p

" Misc keybindings ----------------------------------------
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
nnoremap <F6> :w<CR>:source ~/.vimrc<CR>

"Copy paste
":let @+=@*<CR>

" Cycling through buffers
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>k :bnext<CR>

" ALE settings --------------------------------------------
"let g:ale_sign_error = '▶'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
"dot symbol: \u25CF

"let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_server_path = '/home/skyline/OmniSharp/run'

"The symbol highlighting is under the colorc=scheme otpions#

let g:airline#extensions#ale#enabled = 1

" PaperColor settings -------------------------------------
set t_Co=256
set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1,
  \       'allow_bold': 1,
  \       'override' : {
  \         'color00' : ['', '0'],
  \         'color01' : ['', '9'],
  \         'color02' : ['', '10'],
  \         'color03' : ['', '214'],
  \         'color04' : ['', '0'],
  \         'color05' : ['', '8'],
  \         'color06' : ['', '40'],
  \         'color07' : ['', '15'],
  \         'color08' : ['', '0'],
  \         'color09' : ['', '198'],
  \         'color10' : ['', '197'],
  \         'color11' : ['', '46'],
  \         'color12' : ['', '21'],
  \         'color13' : ['', '201'],
  \         'color14' : ['', '39'],
  \         'color15' : ['', '12'],
  \         'color16' : ['', '39'],
  \         'color17' : ['', '51'],
  \         'cursorline' : ['', '235'],
  \         'cursorlinenr_fg' : ['', '33'],
  \         'cursorlinenr_bg' : ['', '235'],
  \         'popupmenu_fg' : ['', '15'],
  \         'popupmenu_bg' : ['', '235'],
  \         'linenumber_fg' : ['', '244'],
  \         'linenumber_bg' : ['', '0'],
  \         'vertsplit_fg' : ['', '15'],
  \         'vertsplit_bg' : ['', '0'],
  \         'error_fg' : ['', '15'],
  \         'error_bg' : ['', '196'],
  \         'visual_fg' : ['', '15'],
  \         'visual_bg' : ['', '88'],
  \         'folded_fg' : ['', '15'],
  \         'folded_bg' : ['', '21'],
  \         'spellbad' : ['', '57'],
  \         'wildmenu_fg' : ['', '15'],
  \         'wildmenu_bg' : ['', '33'],
  \       },
  \     },
  \   },
  \  'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     }
  \   }
  \ }

colorscheme PaperColor
"colorscheme skylines

"make function calls blue and bold
function ForceFuncCallColor()
  hi Function ctermfg=39 ctermbg=none cterm=none
  syntax match pythonFunction /\v[[:alpha:]_.]+\ze(\s?\()/
  hi def link pythonFunction Function
endfunction

autocmd BufWritePost * call ForceFuncCallColor()

highlight ALEErrorSign ctermfg=196 ctermbg=NONE
highlight ALEWarningSign ctermfg=214 ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight clear SignColumn


" Python-Syntax plugin options ------------------
let python_highlight_all = 1

"END
