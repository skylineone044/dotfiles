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

" autoinstall vim plug if the plugin dir is empty
let need_to_install_plugins = 0
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent  !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin('~/.config/nvim/plugins')

" PLUGINS -------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VS Code plugin framwork support and LSP
Plug 'jackguo380/vim-lsp-cxx-highlight'         " sematic highlighting for C/C++, used with and requires coc.nvim
Plug 'sheerun/vim-polyglot'                     " mostly syntax highlighting language packs
Plug 'hdima/python-syntax'                      " pyhon synax highlighting
Plug 'honza/vim-snippets'                       " snippet collection
" Plug 'danielwe/vim-unicode-snippets'          " unicode symbols in snippets

Plug 'vim-airline/vim-airline'                  " bottom statusline
Plug 'vim-airline/vim-airline-themes'           " bottom statusline theme
Plug 'ryanoasis/vim-webdevicons'                " fancy idons everywhere, mostly for just airline though
Plug 'dense-analysis/ale'                       " code linting

Plug 'benmills/vimux'                           " vim-tmux interface
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                         " fuzzy file search

Plug 'ObserverOfTime/coloresque.vim'            " highlight colorcodes and words in the said color
Plug 'NLKNguyen/papercolor-theme'               " the abse for my theme, required
Plug 'mhinz/vim-startify'                       " start screen

Plug 'tpope/vim-commentary'                     " comment shortcut, autodetects filetype as well
Plug 'tpope/vim-surround'                       " surround text with quotes, {}, [], (), and more
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'mhinz/vim-signify'                        " show vsc file changes in the sighcolumn
Plug 'Yggdroot/indentLine'                      " show vertical lines on indents
Plug 'b3niup/numbers.vim'                       " changing relative and absolute line numbering based in vim modes
Plug 'AndrewRadev/sideways.vim'                 " move arguments sidewas

Plug 'dstein64/vim-startuptime'                 " Measure vim startuptime, brocen down into components

" ------ Nvim 0.5 nightly required
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " semantic code goodies
" ---------------------------------------
call plug#end()

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
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
xmap <leader>F  <Plug>(coc-format)
nmap <leader>F  <Plug>(coc-format)
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

let g:coc_global_extensions = ["coc-explorer", "coc-json", "coc-snippets",
            \"coc-vimlsp", "coc-yank", "coc-clangd", "coc-lua", "coc-markdownlint",
            \"coc-pairs"]

" let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
nmap <leader>dd <Plug>VimspectorContinue
nmap <leader>ds :VimspectorReset<CR>
nmap <leader>b <Plug>VimspectorToggleBreakpoint
nmap <F8> <Plug>VimspectorStepInto
nmap <F9> <Plug>VimspectorStepOver
nmap <F10> <Plug>VimspectorRunToCursor

" Vim theme & bottom infobar
if $USER == 'root'
    let g:airline_theme='simple'
else
    let g:airline_theme='cool'
endif

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
let g:ale_sign_error = '🢂'
let g:ale_sign_warning = '🢂'
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
  " autocmd BufEnter * call VimuxFollowPWD()
augroup END
" map <Leader>T :VimuxCloseRunner<CR>

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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case "" ~', 1,
  \   fzf#vim#with_preview(), <bang>0)


" Bind "//" to a fzf-powered buffer search
nmap // :BLines!<CR>
" Bind "??" to a fzf-powered project search
nmap ?? :Rg!<CR>
" Bind "<leader>p " to a fzf-powered filename search
nmap <leader>p :Files!<CR>
" Bind "cc" to a fzf-powered command search
nmap cc :Commands!<CR>

" Python-Syntax plugin options ----------------------------
let python_highlight_all = 1

" color preview plugin
let g:coloresque_whitelist = [
    \'css', 'haml', 'html', 'htmldjango', 'javascript', 'jsx', 'less', 'php',
    \'postcss', 'pug', 'qml', 'sass', 'scss', 'sh', 'stylus', 'svg',
    \'typescript', 'vim', 'vue', 'xml', 'python', 'py', '', 'go', 'yml'
    \'colors']
"let g:coloresque_blacklist = []

let g:signify_sign_show_text = 1  " main on/off swtich for signify
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0

" indentLine
let g:indentLine_char = '⎟'

" find out more modes to be excuded, by entering them and running :echo &ft
let g:numbers_exclude = ['coc-pyright', 'fzf', 'coc-explorer', 'minibufexpl',
            \ 'nerdtree', 'unite', 'tagbar', 'startify', 'gundo', 'vimshell',
            \'w3m']
let g:numbers_enable = 1

" sidewas.vim
" useing alt key
nnoremap <A-h> :SidewaysLeft<cr>
nnoremap <A-l> :SidewaysRight<cr>

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

nmap <leader>si <Plug>SidewaysArgumentInsertBefore
nmap <leader>sa <Plug>SidewaysArgumentAppendAfter
nmap <leader>sI <Plug>SidewaysArgumentInsertFirst
nmap <leader>sA <Plug>SidewaysArgumentAppendLast

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
set timeoutlen=400
set nowrap
set listchars=tab:⎟\ ,nbsp:␣,trail:˙,eol:¬,extends:»,precedes:«
set relativenumber
set clipboard+=unnamedplus

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
augroup END

map <space> <Leader>
map :W :w<CR>
map :Q :q<CR>
map <CapsLock> <Esc>
map <Leader>F :Format<CR>

"Reload vimrc
nnoremap <F6> :w<CR>:source ~/.config/nvim/init.vim<CR>

"navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>. :split<CR>
nnoremap <leader>, :vsplit<CR>
"
" move vertically by visual line
nnoremap j gj
nnoremap k gk
nmap <Leader>c gcc
vmap <Leader>c gc

nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" buffer navigation
nnoremap <C-b> :buffers<CR>:buffer<space>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

" better find and replace
vnoremap <leader>s "hy:%s/<C-r>h//gc<left><left><left>
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" terminal
nnoremap <Leader>T :vsplit<CR>:terminal<CR>i
tnoremap <C-\> <C-\><C-n>

" git fugitive
nnoremap <Leader>G :G<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

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

" SEPARATE PAPERCOLOR PALETTE FILE REQUIRED
highlight Visual term=reverse cterm=reverse guibg=Grey
" let g:PaperColor_Theme = 'stardust'
" colorscheme PaperColor
set rtp+=/home/skyline/git/nvim-highlite
colorscheme stardust_TS
hi Normal ctermbg=none  "overwrite highlite settings, because it seems it cant do NONE as background

highlight clear SignColumn
hi ColorColumn ctermbg=236 guibg=236

set t_ZH=^[[3m
set t_ZR=^[[23m
hi HighlightedyankRegion ctermbg=236

" ---------------------- TRESITTER

lua <<EOF

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
}
EOF

" END
