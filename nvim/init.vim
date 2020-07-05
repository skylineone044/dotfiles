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
"Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'b3niup/numbers.vim'
Plug 'dense-analysis/ale'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hdima/python-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dstein64/vim-startuptime'
Plug 'DougBeney/pickachu'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'davidhalter/jedi-vim'
Plug 'ObserverOfTime/coloresque.vim'

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" ---------------------------------------
call plug#end()

" coc settings --------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

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
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>

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
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

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
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>;  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>u  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>y  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"split navigations ----------------------------------------
nnoremap <leader>J <C-W><C-J>
nnoremap <leader>K <C-W><C-K>
nnoremap <leader>L <C-W><C-L>
nnoremap <leader>H <C-W><C-H>
"nnoremap <leader>w <C-W>-
"nnoremap <leader>a <C-W>>
"nnoremap <leader>s <C-W>+
"nnoremap <leader>d <C-W><
nnoremap <leader>. :split<CR>
nnoremap <leader>, :vsplit<CR>

" Line numbering ------------------------------------------
set number

" syntax highlighting -------------------------------------
syntax on

" Vim theme & bottom infobar ------------------------------
let g:airline_theme='cool'
" other themes to try: murmur, papercolor
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
"
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

set encoding=utf-8
set ttyfast
set lazyredraw

" Various settings ----------------------------------------
set cursorline
set cursorcolumn
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
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
set mouse=a

" Set Marker character for whitespace ---------------------
set listchars=tab:⎟\ ,nbsp:␣,trail:˙,eol:¬,extends:»,precedes:«

" move vertically by visual line --------------------------
nnoremap j gj
nnoremap k gk

"JEDI -----------------------------------------------------
"autocmd FileType python let g:jedi#auto_initialization = 1
"let g:jedi#usages_command = "<C-j>"

"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 1
"let g:jedi#popup_on_dot = 1
"let g:jedi#popup_select_first = 1
"autocmd FileType python call jedi#configure_call_signatures()


" Custom shortcuts ----------------------------------------
augroup configgroup
  autocmd!
  autocmd FileType python nnoremap <F5> <esc>:w<CR>:!%:p<CR>
  autocmd FileType python map ## ggi#!/usr/bin/env python3<CR><esc>
  autocmd FileType python map <leader>i iif __name__ == "__main__":<CR>
  autocmd FileType python map <leader>c I# <esc>j
  autocmd FileType c  map <leader>c I// <esc>j
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

"Cycle number schemes
"map <silent> <Leader>r :call mappings#cycle_numbering()<CR>
"Reload vimrc
nnoremap <F6> :w<CR>:source ~/.config/nvim/init.vim<CR>

" Pickachu settings ---------------------------------------
let g:pickachu_default_color_format = "hex"
let g:pickachu_default_date_format = "%Y.%m.%d."
let g:pickachu_default_command = "qarma"   " REQUIRES QARMA TO BE INSTALLED

" FZF key bindings ----------------------------------------
nnoremap <C-f> :FZF<CR>
"let g:fzf_action = {
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-i': 'split',
  "\ 'ctrl-v': 'vsplit' }

" ALE settings --------------------------------------------
"let g:ale_sign_error = '▶'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
"dot symbol: \u25CF
let g:ale_completion_enabled = 0

" PaperColor settings -------------------------------------
set t_Co=256
set background=dark
hi Normal ctermbg=none

" SEPARATE PAPERCOLOR PALETTE FILE REQUIRED
let g:PaperColor_Theme = 'stardust'
colorscheme PaperColor

hi CursorLine ctermbg=234

hi CursorColumn ctermbg=none
"
"make function calls blue and bold
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

" Python-Syntax plugin options ----------------------------
let python_highlight_all = 1

" color preview plugin
let g:coloresque_whitelist = [
    \'css', 'haml', 'html', 'htmldjango', 'javascript', 'jsx', 'less', 'php',
    \'postcss', 'pug', 'qml', 'sass', 'scss', 'sh', 'stylus', 'svg',
    \'typescript', 'vim', 'vue', 'xml', 'python', 'py', '', 'go']
"let g:coloresque_blacklist = []

"END
