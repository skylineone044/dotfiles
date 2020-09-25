"   _______________________________________________________________________________________
"    _______________________________________________________________________________________
"     __/\\\________________/\\\_____/\\\___________________________/\\\_____________________
"      _\///___/\\/\\\\\\___\///___/\\\\\\\\\\\________/\\\____/\\\_\///_____/\\\\\__/\\\\\___
"       __/\\\_\/\\\////\\\___/\\\_\////\\\////________\//\\\__/\\\___/\\\__/\\\///\\\\\///\\\_
"        _\/\\\_\/\\\__\//\\\_\/\\\____\/\\\_____________\//\\\/\\\___\/\\\_\/\\\_\//\\\__\/\\\_
"         _\/\\\_\/\\\___\/\\\_\/\\\____\/\\\_/\\__________\//\\\\\____\/\\\_\/\\\__\/\\\__\/\\\_
"          _\/\\\_\/\\\___\/\\\_\/\\\____\//\\\\\____/\\\____\//\\\_____\/\\\_\/\\\__\/\\\__\/\\\_
"           _\///__\///____\///__\///______\/////____\///______\///______\///__\///___\///___\///__


" vim-plug ------------------------------------------------
call plug#begin('~/.config/nvim/plugins')

" PLUGINS -------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VS Code plugin framwork support and LSP
Plug 'jackguo380/vim-lsp-cxx-highlight'         " sematic highlighting for C/C++, used with and requires coc.nvim
Plug 'sheerun/vim-polyglot'                     " mostly syntax highlighting language packs
Plug 'hdima/python-syntax'                      " pyhon synax highlighting

Plug 'vim-airline/vim-airline'                  " bottom statusline
Plug 'vim-airline/vim-airline-themes'           " bottom statusline theme
Plug 'ryanoasis/vim-webdevicons'                " fancy idons everywhere, mostly for just airline though
Plug 'dense-analysis/ale'                       " code linting

Plug 'benmills/vimux'                           " vim-tmux interface
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                         " fuzzy file search

Plug 'ObserverOfTime/coloresque.vim'            " highlight colorcodes and words in the said color
Plug 'NLKNguyen/papercolor-theme'               " the abse for my theme, required

Plug 'tpope/vim-commentary'                     " comment shortcut, autodetects filetype as well
Plug 'tpope/vim-surround'                       " surround text with quotes, {}, [], (), and more
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'mhinz/vim-signify'                        " show vsc file changes in the sighcolumn
Plug 'b3niup/numbers.vim'                       " changing relative and absolute line numbering based in vim modes
Plug 'jiangmiao/auto-pairs'                     " parenthesys and quote sighn auto pairing

Plug 'dstein64/vim-startuptime'                 " Measure vim startuptime, brocen down into components
" ---------------------------------------
call plug#end()

map <space> <Leader>

" coc settings --------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>F  <Plug>CocAction('format')
nmap <leader>F  <Plug>CocAction('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <leader>e :CocCommand explorer<CR>
augroup cocexplorer
    autocmd!
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup END

let g:coc_global_extensions = ["coc-explorer", "coc-json", "coc-snippets",
            \"coc-vimlsp", "coc-yank", "coc-clangd", "coc-lua", "coc-markdownlint",
            \"coc-python"]

" Vim theme & bottom infobar
let g:airline_theme='cool'
let g:airline_powerline_fonts=1
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
let airline#extensions#coc#warning_symbol = '◭ '
""enable/disable ale integration
let g:airline#extensions#ale#enabled = 1
" ale error_symbol
let airline#extensions#ale#error_symbol = '⛔'
" ale warning
let airline#extensions#ale#warning_symbol = '◭ '
" ale show_line_numbers
let airline#extensions#ale#show_line_numbers = 1
" ale open_lnum_symbol
let airline#extensions#ale#open_lnum_symbol = " ⏵"
" ale close_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ''

" ALE settings --------------------------------------------
"let g:ale_sign_error = '▶'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
"dot symbol: \u25CF
let g:ale_completion_enabled = 0

" vimux settings ----------------------------------------
" make the already open tmux terminal split follow the dir of the currently open file,
" this function is rum wuth autocmd on BufEnter
function! VimuxFollowPWD()
    call VimuxSendText('cd ' . expand('%:p:h') . ' && clear')
    call VimuxSendKeys("Enter")
    redraw!
endfunction


let g:VimuxHeight = "40"     " default is 20 (0-100%)
let g:VimuxOrientation = "h" " default is v (v/h)
let g:VimuxUseNearest = 1    " default is 1 (0/1)
"
" autocmd FileType python nnoremap <F5> <esc>:w<CR>:!%:p<CR>    " the next line replaces this,
" and even better: it's using vimux to rum the current python file ina tmux pane
augroup vimux1
  autocmd!
  autocmd FileType python nnoremap <F5> :w<CR>:call VimuxRunCommandInDir('python ', 1)<CR>
  autocmd BufEnter * call VimuxFollowPWD()
augroup END
map <Leader>T :VimuxCloseRunner<CR>

" map <Leader>f :call VimuxFollowPWD()<CR>
nnoremap <Leader>t :call VimuxRunCommand('cd ' . expand('%:p:h') . ' && clear')<CR>

silent !VimuxSendKeys
silent !VimuxSendText
silent !VimuxRunCommand
silent !VimuxRunCommandInDir
silent !VimuxCloseRunner
"
" Pickachu settings ---------------------------------------
let g:pickachu_default_color_format = "hex"
let g:pickachu_default_date_format = "%Y.%m.%d."
let g:pickachu_default_command = "qarma"   " REQUIRES QARMA TO BE INSTALLED

" FZF key bindings ----------------------------------------
nnoremap <C-f> :FZF<CR>
let g:fzf_layout = { 'down': '~40%' }

" Python-Syntax plugin options ----------------------------
let python_highlight_all = 1

" color preview plugin
let g:coloresque_whitelist = [
    \'css', 'haml', 'html', 'htmldjango', 'javascript', 'jsx', 'less', 'php',
    \'postcss', 'pug', 'qml', 'sass', 'scss', 'sh', 'stylus', 'svg',
    \'typescript', 'vim', 'vue', 'xml', 'python', 'py', '', 'go', 'yml']
"let g:coloresque_blacklist = []

let g:signify_sign_show_text = 1  " main on/off swtich for signify
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0

" find out more modes to be excuded, by entering them and running :echo &ft
let g:numbers_exclude = ['fzf', 'coc-explorer', 'minibufexpl',
            \ 'nerdtree', 'unite', 'tagbar', 'startify', 'gundo', 'vimshell',
            \'w3m']
"
" base vim settings ----------------------------------------
set encoding=utf-8
set ttyfast
set lazyredraw
syntax enable

set number
set cursorline
set wildoptions=pum

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab
set smarttab

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

set colorcolumn=80
set timeoutlen=450
set nowrap
set listchars=tab:⎟\ ,nbsp:␣,trail:˙,eol:¬,extends:»,precedes:«

" set foldmethod=syntax
" set nofoldenable
"set cursorcolumn  " this bad boi is slow AF
" set guicursor=   "Uncommenting this disables the cursor syle change (block/I beam/underline)
"                   that is the default when changing ebtween nvim modes (Normal/Insert/Replace)

" persistent undo
" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.cache/vim_undo_history')    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif    " point Vim to the defined undo directory.
    let &undodir = target_path    " finally, enable undo persistence.
    set undofile
endif

" Custom shortcuts ----------------------------------------
augroup configgroup
  autocmd!
  " autocmd FileType python nnoremap <F5> <esc>:w<CR>:!%:p<CR>
  autocmd FileType python map <leader># ggi#!/usr/bin/env python3<CR><esc>
  autocmd FileType python map <leader>i iif __name__ == "__main__":<CR>
  autocmd VimEnter * map <leader>n :vsplit<CR><C-W>r:Np<CR>
augroup END

map <space> <Leader>
map :W :w<CR>
map :Q :q<CR>
map <CapsLock> <Esc>
map <Leader>F :Format<CR>

"Reload vimrc
nnoremap <F6> :w<CR>:source ~/.config/nvim/init.vim<CR>

"navigations
nnoremap <leader>J <C-W><C-J>
nnoremap <leader>K <C-W><C-K>
nnoremap <leader>L <C-W><C-L>
nnoremap <leader>H <C-W><C-H>
nnoremap <leader>. :split<CR>
nnoremap <leader>, :vsplit<CR>
"
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nmap <Leader>c gcc
vmap <Leader>c gc

" buffer navigation
nnoremap <leader>b :buffers<CR>:buffer<space>
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprevious<CR>

" use sytem clipborad
" noremap <Leader>Y "+y
" noremap <Leader>P "+p
set clipboard+=unnamedplus

augroup autocd
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END
" Return to last edit position when opening files (You want this!)
augroup continueWhereYouLeftOff
    autocmd!
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
augroup END

" PaperColor settings -------------------------------------
set t_Co=256
set background=dark
hi Normal ctermbg=none

" SEPARATE PAPERCOLOR PALETTE FILE REQUIRED
let g:PaperColor_Theme = 'stardust'
colorscheme PaperColor

hi CursorLine ctermbg=234
hi CursorColumn ctermbg=none
hi NonText ctermfg=238
hi statusline ctermbg=250 ctermfg=235

" make function calls blue and bold
function ForceFuncCallColor()
  hi Function ctermfg=39 ctermbg=none cterm=none
  syntax match pythonFunction /\v[[:alpha:]_.*]+\ze(\s?\()/
  hi def link pythonFunction Function
  hi link pythonBuiltin Function
endfunction
autocmd BufEnter * call ForceFuncCallColor()
autocmd BufWritePost * call ForceFuncCallColor()
autocmd InsertLeave * call ForceFuncCallColor()

highlight ALEErrorSign ctermfg=196 ctermbg=NONE
highlight ALEWarningSign ctermfg=214 ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight clear SignColumn
hi ColorColumn ctermbg=236 guibg=236

set t_ZH=^[[3m
set t_ZR=^[[23m
highlight Comment cterm=italic
hi HighlightedyankRegion ctermbg=236

highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

" END
