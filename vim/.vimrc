" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
" PLUGINS -------------------------------
Plug 'jackguo380/vim-lsp-cxx-highlight'         " sematic highlighting for C/C++, used with and requires coc.nvim
Plug 'sheerun/vim-polyglot'                     " mostly syntax highlighting language packs
Plug 'hdima/python-syntax'                      " pyhon synax highlighting
Plug 'ARM9/arm-syntax-vim'                      " arm syntax highlighting
" Plug 'SirVer/ultisnips'                         " the ultimate snippet engine
Plug 'honza/vim-snippets'                       " snippet collection
Plug 'sbdchd/neoformat'                         " autoformatting in many filetypes
" Plug 'danielwe/vim-unicode-snippets'          " unicode symbols in snippets

Plug 'vim-airline/vim-airline'                  " bottom statusline
Plug 'vim-airline/vim-airline-themes'           " bottom statusline theme
Plug 'ryanoasis/vim-webdevicons'                " fancy idons everywhere, mostly for just airline though
Plug 'dense-analysis/ale'                       " code linting

Plug 'benmills/vimux'                           " vim-tmux interface
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                         " fuzzy file search
Plug 'chengzeyi/fzf-preview.vim'                " file preview for fzf

Plug 'NLKNguyen/papercolor-theme'               " the abse for my theme, required
Plug 'mhinz/vim-startify'                       " start screen

Plug 'tpope/vim-commentary'                     " comment shortcut, autodetects filetype as well
Plug 'tpope/vim-surround'                       " surround text with quotes, {}, [], (), and more
Plug 'tpope/vim-repeat'                         " repeat plugin actions
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'mhinz/vim-signify'                        " show vsc file changes in the sighcolumn
Plug 'b3niup/numbers.vim'                       " changing relative and absolute line numbering based in vim modes
Plug 'AndrewRadev/sideways.vim'                 " move arguments sidewas
Plug 'matze/vim-move'                           " move selected text arond

Plug 'dstein64/vim-startuptime'                 " Measure vim startuptime, brocen down into components
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

filetype plugin indent on
syntax on

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

map <space> <Leader>

let g:airline_theme='cool'

let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '⏵'
let g:airline_symbols.maxlinenr = ''
" make sure the items are separate, it is the only way to make part of it bold
call airline#parts#define_accent(" ⏵%l", 'bold')
let g:airline_section_z = airline#section#create(["%p%%", " ⏵%l", "/%L", ": %c"]) "(percentage, line number, column number)
" coc integration
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '⛔'
let airline#extensions#coc#warning_symbol = '⚠️'
""enable/disable ale integration
let g:airline#extensions#ale#enabled = 1
" ale error_symbol
let airline#extensions#ale#error_symbol = '⛔'
" ale warning
let airline#extensions#ale#warning_symbol = '⚠️'
" ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1
" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = " ⏵"
" ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ''

" ALE settings --------------------------------------------
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠️'

let g:ale_completion_enabled = 0

nnoremap <C-f> :FZF<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" Bind "//" to a fzf-powered buffer search
nmap // :BLines!<CR>
" Bind "??" to a fzf-powered project search
nmap ?? :Rg!<CR>
" Bind "<leader>p " to a fzf-powered filename search
nmap <leader>p :Files!<CR>
" Bind "cc" to a fzf-powered command search
nmap cc :Commands!<CR>

" fugitive ----------------------
nnoremap <leader>g :Git<CR>
nnoremap <leader>gp :Git push<CR>

let g:signify_sign_show_text = 1  " main on/off swtich for signify
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0

" find out more modes to be excuded, by entering them and running :echo &ft
let g:numbers_exclude = ['coc-pyright', 'fzf', 'coc-explorer', 'minibufexpl',
            \ 'nerdtree', 'unite', 'tagbar', 'startify', 'gundo', 'vimshell',
            \'w3m']
let g:numbers_enable = 1

" sidewas.vim
nnoremap gh :SidewaysLeft<cr>
nnoremap gl :SidewaysRight<cr>


set encoding=utf-8
set ttyfast
set lazyredraw
syntax enable

set relativenumber
set cursorline

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent
set smartindent
set expandtab
set smarttab

set wrap
set linebreak
set breakindent
set showbreak=↳
set virtualedit=all
set conceallevel=2
set concealcursor=""

set showcmd
set list

set splitbelow
set splitright
" set wildmode=longest,list,full
set wildmode=full
set wildmenu
set showmatch

set incsearch
set hlsearch
set ignorecase
set smartcase
set mouse=a
set scrolloff=4

set colorcolumn=80
set timeoutlen=400
set listchars=tab:›\ ,nbsp:␣,trail:⸱,eol:¬,extends:»,precedes:«
set completeopt+=noinsert,menuone,preview
set clipboard+=unnamedplus
set termguicolors

" change cursor type for different modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set background=dark
colorscheme slate
highlight Normal ctermbg=NONE guibg=NONE
highlight ColorColumn ctermbg=236 guibg=#303030
highlight CursorLine ctermbg=238 guibg=#444444 cterm=NONE gui=NONE
highlight CursorLineNr ctermbg=238 guibg=#444444 ctermfg=39 guifg=#ffffff cterm=NONE gui=NONE
highlight NonText ctermbg=NONE guibg=NONE

nnoremap Y y$

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ; ;<c-g>u

nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

nnoremap H 0
nnoremap L $

" hide search results with <leader>/
set hlsearch
noremap <leader>/ :nohls<CR><leader>/


nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>. :split<CR>
nnoremap <leader>, :vsplit<CR>

nnoremap j gj
nnoremap k gk

nnoremap <C-b> :buffers<CR>:buffer<space>
nnoremap <C-h> :bnext<CR>
nnoremap <C-l> :bprevious<CR>

" hide search results with <leader>/
noremap <leader>/ :nohls<CR><leader>/

" better find and replace
vnoremap <leader>s "hy:%s/<C-r>h//gc<left><left><left>
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" trim whitespace on write
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup whitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Return to last edit position when opening files (You want this!)
augroup continueWhereYouLeftOff
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END


" SEPARATE PAPERCOLOR PALETTE FILE REQUIRED
if empty(glob('~/.vim/autoload/PaperColor_stardust.vim'))
    silent !curl -fLo ~/.vim/autoload/PaperColor_stardust.vim --create-dirs
        \ https://gitlab.com/skylineone044/dotfiles/-/raw/master/vim/PaperColor_stardust.vim
endif
hi Normal ctermbg=none
highlight Visual term=reverse cterm=reverse guibg=Grey
let g:PaperColor_Theme = 'stardust'
colorscheme PaperColor

hi CursorLine ctermbg=234 guibg=#1c1c1c
hi CursorColumn ctermbg=none guibg=NONE
hi NonText ctermfg=240 guifg=#585858 guibg=NONE
hi statusline ctermbg=250 ctermfg=235 guibg=#bcbcbc guifg=#262626

" make function calls blue and bold
function ForceFuncCallColor()
    hi Function ctermfg=39 ctermbg=NONE cterm=NONE
    syntax match pythonFunction /\v[[:alpha:]_.*]+\ze(\s?\()/
    hi def link pythonFunction Function
    hi link pythonBuiltin Function
endfunction

augroup blue_function_calls
    autocmd!
    autocmd BufEnter * call ForceFuncCallColor()
    autocmd BufWritePost * call ForceFuncCallColor()
    autocmd InsertLeave * call ForceFuncCallColor()
augroup END

highlight ALEErrorSign ctermfg=196 ctermbg=NONE guibg=NONE
highlight ALEWarningSign ctermfg=214 ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight clear SignColumn
hi ColorColumn ctermbg=236 guibg=#303030

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

highlight Comment cterm=italic
hi HighlightedyankRegion ctermbg=236 guibg=#303030
hi CocHighlightText term=reverse cterm=reverse gui=reverse

highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
