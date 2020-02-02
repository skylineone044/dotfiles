 "___  ________   ___  _________    ___      ___ ___  _____ ______      
"|\  \|\   ___  \|\  \|\___   ___\ |\  \    /  /|\  \|\   _ \  _   \    
"\ \  \ \  \\ \  \ \  \|___ \  \_| \ \  \  /  / | \  \ \  \\\__\ \  \   
" \ \  \ \  \\ \  \ \  \   \ \  \   \ \  \/  / / \ \  \ \  \\|__| \  \  
"  \ \  \ \  \\ \  \ \  \   \ \  \ __\ \    / /   \ \  \ \  \    \ \  \ 
"   \ \__\ \__\\ \__\ \__\   \ \__\\__\ \__/ /     \ \__\ \__\    \ \__\
"    \|__|\|__| \|__|\|__|    \|__\|__|\|__|/       \|__|\|__|     \|__|

"

" vim-plug ------------------------------------------------
call plug#begin('~/.config/nvim/plugins')

" PLUGINS -------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'b3niup/numbers.vim'
"Plug 'davidhalter/jedi-vim'
"    REQUIRED FOR JEDI:
"    python2-pylint python-pylint python-jedi python2-jedi
"Plug 'ervandew/supertab'
"Plug 'fatih/vim-go'
"Plug 'mcchrish/nnn.vim'
"Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'dense-analysis/ale'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hdima/python-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'kien/rainbow_parentheses.vim'
" ---------------------------------------
call plug#end()
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
set guicursor=

" Set Marker character for whitespace ---------------------
set listchars=tab:⎟\ ,nbsp:␣,trail:˙,eol:¬,extends:»,precedes:«

" move vertically by visual line --------------------------
nnoremap j gj
nnoremap k gk

"JEDI -----------------------------------------------------
"autocmd FileType python let g:jedi#auto_initialization = 1
"let g:jedi#usages_command = "<C-j>"
"let g:jedi#popup_on_dot = 1
"let g:jedi#completions_enabled = 1

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
nnoremap <F6> :w<CR>:source ~/.config/nvim/init.vim<CR>

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

" Python-Syntax plugin options ----------------------------
let python_highlight_all = 1

" coc settings --------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

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

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"END
