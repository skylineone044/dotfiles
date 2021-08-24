" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
" PLUGINS -------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VS Code plugin framwork support and LSP
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

filetype plugin indent on
syntax on

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

map <space> <Leader>

" coc settings --------------------------------------------
"
"" TextEdit might fail if hidden is not set.
set hidden
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>F  :Format<CR>
nmap <leader>F  :Format<CR>
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <leader>e :CocCommand explorer<CR>
augroup cocexplorer
    autocmd!
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup END

nmap <leader>f :CocFix<CR>

let g:coc_global_extensions = [
            \"coc-pyright", "coc-sh",
            \"coc-clangd", "coc-java", "coc-java-debug", "coc-lua",
            \"coc-html", "coc-css", "coc-phpls",
            \"coc-explorer", "coc-json", "coc-snippets",
            \"coc-vimlsp", "coc-yank", "coc-calc", "coc-diagnostic",
            \"coc-markdownlint", "coc-pairs", "coc-lines", "coc-emoji",
            \"coc-syntax"
            \]

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
