"   _______________________________________________________________________________________
"    _______________________________________________________________________________________
"     __/\\\________________/\\\_____/\\\___________________________/\\\_____________________
"      _\///___/\\/\\\\\\___\///___/\\\\\\\\\\\________/\\\____/\\\_\///_____/\\\\\__/\\\\\___
"       __/\\\_\/\\\////\\\___/\\\_\////\\\////________\//\\\__/\\\___/\\\__/\\\///\\\\\///\\\_
"        _\/\\\_\/\\\__\//\\\_\/\\\____\/\\\_____________\//\\\/\\\___\/\\\_\/\\\_\//\\\__\/\\\_
"         _\/\\\_\/\\\___\/\\\_\/\\\____\/\\\_/\\__________\//\\\\\____\/\\\_\/\\\__\/\\\__\/\\\_
"          _\/\\\_\/\\\___\/\\\_\/\\\____\//\\\\\____/\\\____\//\\\_____\/\\\_\/\\\__\/\\\__\/\\\_
"           _\///__\///____\///__\///______\/////____\///______\///______\///__\///___\///___\///__

 if !exists('g:vscode')
" ordinary neovim
" vim-plug ------------------------------------------------

" autoinstall vim plug if the plugin dir is empty
let need_to_install_plugins = 0
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent  !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

filetype plugin indent on
syntax enable

call plug#begin('~/.config/nvim/plugins')

" PLUGINS -------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'} " VS Code plugin framwork support and LSP
Plug 'jackguo380/vim-lsp-cxx-highlight'         " sematic highlighting for C/C++, used with and requires coc.nvim
Plug 'sheerun/vim-polyglot'                     " mostly syntax highlighting language packs
" Plug 'hdima/python-syntax'                      " pyhon synax highlighting
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

Plug 'norcalli/nvim-colorizer.lua'              " highlight hex colors
Plug 'lambdalisue/glyph-palette.vim'            " colors for nerdfont icons
Plug 'NLKNguyen/papercolor-theme'               " the abse for my theme, required
Plug 'mhinz/vim-startify'                       " start screen
" Plug 'luukvbaal/stabilize.nvim'                 " stabilize buffer content on window open / close events

Plug 'tpope/vim-commentary'                     " comment shortcut, autodetects filetype as well
Plug 'tpope/vim-surround'                       " surround text with quotes, {}, [], (), and more
Plug 'tpope/vim-repeat'                         " repeat plugin actions
Plug 'tpope/vim-fugitive'                       " Git integration
Plug 'lervag/vimtex'                            " LaTeX
Plug 'mhinz/vim-signify'                        " show vsc file changes in the sighcolumn
Plug 'junegunn/gv.vim'                          " git commit browser
Plug 'ggandor/lightspeed.nvim'                  " move around the screen
Plug 'lukas-reineke/indent-blankline.nvim'      " show vertical lines on indents
Plug 'b3niup/numbers.vim'                       " changing relative and absolute line numbering based in vim modes
Plug 'AndrewRadev/sideways.vim'                 " move arguments sidewas
Plug 'matze/vim-move'                           " move selected text arond

Plug 'dstein64/vim-startuptime'                 " Measure vim startuptime, brocen down into components

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " semantic code goodies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'abecodes/tabout.nvim'                     " tab out of braces
Plug 'narutoxy/dim.lua'                         " dim unused variables
" Plug 'p00f/nvim-ts-rainbow'                     " rainbow parens
"
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
            \"coc-html", "coc-css", "coc-phpls", "coc-tsserver",
            \"coc-explorer", "coc-json", "coc-snippets",
            \"coc-vimlsp", "coc-yank", "coc-calc", "coc-diagnostic",
            \"coc-markdownlint", "coc-pairs", "coc-lines", "coc-emoji",
            \"coc-syntax"
            \]

" neoformat
let g:neoformat_enabled_python = ['black', 'autopep8']
let g:neoformat_enabled_css = ['cssbeautify', 'prettier']
let g:neoformat_enabled_html = ['htmlbeautify']
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


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

" indent blankline -------
let g:indent_blankline_enabled = v:true

let g:indent_blankline_char = '│'

let g:indent_blankline_indent_level = 20
let g:indent_blankline_viewport_buffer = 20

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_context_patterns = ['%S+']

" vimux settings ----------------------------------------
" make the already open tmux terminal split follow the dir of the currently open file,
" this function is rum wuth autocmd on BufEnter
function! VimuxFollowPWD()
    call VimuxSendText('cd ' . expand('%:p:h') . ' && clear')
    call VimuxSendKeys("Enter")
    redraw!
endfunction


let g:VimuxHeight = "30"     " default is 20 (0-100%)
let g:VimuxOrientation = "v" " default is v (v/h)
let g:VimuxUseNearest = 1    " default is 1 (0/1)
"
" autocmd FileType python nnoremap <F5> <esc>:w<CR>:!%:p<CR>    " the next line replaces this,
" and even better: it's using vimux to rum the current python file ina tmux pane
augroup vimux1
    autocmd!
    autocmd FileType python nnoremap <F5> :w<CR>:call VimuxRunCommandInDir('python ', 1)<CR>
    autocmd FileType javascript nnoremap <F5> :w<CR>:call VimuxRunCommandInDir('node ', 1)<CR>
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
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

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

" telescope.nvim
lua << EOF
require('telescope').setup{
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons = true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        set_env = { ['COLORTERM'] = 'truecolor' },
    },
    extensions = {
        fzy_native = {
        override_genric_sorter = false,
        override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
EOF

fun! ProjectSearch()
:cd %:h | cd `git rev-parse --show-toplevel`
Telescope find_files
endfun

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>cd ~<cr><cmd>Telescope find_files<cr>
nnoremap <leader>fp :<C-U>call ProjectSearch()<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" stabilize
" lua << EOF
" require("stabilize").setups()
" EOF

" fugitive ----------------------
nnoremap <leader>g :Git<CR>
nnoremap <leader>gp :Git push<CR>

" vimtex ------------------------
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" Python-Syntax plugin options ----------------------------
let python_highlight_all = 1

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true
  },
  indent = {
      enable = false
  },
  incremental_selection = {
      enable = true,
      keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
      },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  }
}

require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}

require('dim').setup {
  disable_lsp_decorations = true, -- disable virt text and underline by lsp on unused vars and functions
  change_in_insert = true -- change highlights in insert mode (real time updates)
}
EOF

" sidewas.vim
" useing alt key
nnoremap gh :SidewaysLeft<cr>
nnoremap gl :SidewaysRight<cr>

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

set cursorline
set wildoptions=pum

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set autoindent
set smartindent
set expandtab
set smarttab
set cindent

set wrap
set linebreak
set breakindent
set showbreak=↳
set virtualedit=all
set conceallevel=2
set concealcursor=""
set foldmethod=indent

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
set backspace=indent,eol,start
set completeopt+=noinsert,menuone,preview
set relativenumber
set clipboard+=unnamedplus
set termguicolors
" coloriser
lua require'colorizer'.setup()

" set foldmethod=syntax
" set nofoldenable
" set cursorcolumn  " this bad boi is slow AF
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
    autocmd FileType sh map <leader># ggi#!/bin/bash<CR><esc>
augroup END

map <space> <Leader>
map :W :w<CR>
map :Q :q<CR>
map <CapsLock> <Esc>
map <Leader>F :Format<CR>
map <Leader>N :Neoformat<CR>

nnoremap Y y$

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ; ;<c-g>u

augroup formating
    autocmd!
    autocmd FileType java nmap <Leader>F :Format<CR>
    autocmd FileType html nmap <Leader>F :Neoformat<CR>
    autocmd FileType css nmap <Leader>F :Neoformat<CR>
    " autocmd FileType r set ft=ia64
    au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
augroup END

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

" nnoremap ; :

nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" buffer navigation
nnoremap <C-b> :buffers<CR>:buffer<space>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

nnoremap H 0
nnoremap L $

" hide search results with <leader>/
noremap <leader>/ :nohls<CR><leader>/

" better find and replace
vnoremap <leader>s "hy:%s/<C-r>h//gc<left><left><left>
nmap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Search literally!
com! -nargs=1 Search :let @/='\V'.escape(<q-args>, '\\')| normal! n
com! -nargs=1 LitSearch :let @/='\V'.escape(<q-args>, '\\')| normal! n
com! -nargs=1 Lits :let @/='\V'.escape(<q-args>, '\\')| normal! n

nnoremap <leader>q :Search<space>

" terminal
nnoremap <Leader>T :vsplit<CR>:terminal<CR>i
tnoremap <C-\> <C-\><C-n>

" remap up down to left right in the wildmenu, so it actually moves the
" seleciton correctly"
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

augroup autocd
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END

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

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{timeout=250}
augroup END

augroup folding
    autocmd!
    " start with all folds opened
    autocmd BufWinEnter * normal zR
augroup END

 " augroup remember_folds
 "  autocmd!
 "  let ftToIgnore = ['FILES']
 "  autocmd BufWinLeave * if index(ftToIgnore, &ft) < 0 | mkview
 "  autocmd BufWinEnter * if index(ftToIgnore, &ft) < 0 | silent! loadview
" augroup END


" Colorscheme settings -------------------------------------
" set t_Co=256
set background=dark
if has('nvim-0.5') " if running nvim >= 0.5 then use treesitter, otherwise fall back to the old papercolor setup
    highlight Visual term=reverse cterm=reverse guibg=Grey
    set rtp+=/home/skyline/git/nvim-highlite
    colorscheme stardust_TS
    hi Normal ctermbg=NONE guibg=NONE "overwrite highlite settings, because it seems it cant do NONE as background
    hi CocHighlightText ctermbg=239 guibg=#4e4e4e

    hi ColorColumn ctermbg=236 guibg=#303030

    set t_ZH=^[[3m
    set t_ZR=^[[23m
    hi HighlightedyankRegion ctermbg=236 guibg=#303030
    highlight IndentBlanklineChar guifg=#505050 gui=nocombine
    highlight IndentBlanklineContextChar guifg=#f1f1f1 gui=nocombine

else " old setup, for fallback
    " SEPARATE PAPERCOLOR PALETTE FILE REQUIRED
    if empty(glob('~/.config/nvim/PaperColor_stardust.vim'))
        silent !curl -fLo ~/.config/nvim/PaperColor_stardust.vim --create-dirs
            \ https://gitlab.com/skylineone044/dotfiles/-/raw/master/vim/PaperColor_stardust.vim
    endif
    hi Normal ctermbg=none
    highlight Visual term=reverse cterm=reverse guibg=Grey
    let g:PaperColor_Theme = 'stardust'
    colorscheme PaperColor

    hi CursorLine ctermbg=234 guibg=#1c1c1c
    hi CursorColumn ctermbg=none guibg=NONE
    hi NonText ctermfg=238 guibg=#444444
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

    set t_ZH=^[[3m
    set t_ZR=^[[23m
    highlight Comment cterm=italic
    hi HighlightedyankRegion ctermbg=236 guibg=#303030
    hi CocHighlightText term=reverse cterm=reverse gui=reverse

    highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
    highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
    highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
endif

else
" minimal-ish setup for the VSCode extension
map <space> <Leader>
nnoremap Y y$

nnoremap H 0
nnoremap L $
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
Plug 'tpope/vim-commentary'                     " comment shortcut, autodetects filetype as well
Plug 'tpope/vim-surround'                       " surround text with quotes, {}, [], (), and more
Plug 'tpope/vim-repeat'                         " repeat plugin actions
Plug 'ggandor/lightspeed.nvim'                  " move around the screen
Plug 'AndrewRadev/sideways.vim'                 " move arguments sidewas
" ---------------------------------------
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

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

" sidewas.vim
nnoremap gh :SidewaysLeft<cr>
nnoremap gl :SidewaysRight<cr>

nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
endif
