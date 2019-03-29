" Vim colorscheme template file
" Author: Gerardo Galindez <gerardo.galindez@gmail.com>
" Maintainer: Gerardo Galindez <gerardo.galindez@gmail.com>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

" --------------------------------
set background=dark
" - or ---------------------------
"set background=light
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="skylines"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=White    ctermbg=none    cterm=none
hi Cursor          ctermfg=White    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=Black    cterm=none
hi LineNr          ctermfg=White    ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=BLue    ctermbg=Black    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=White    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=White    ctermbg=none    cterm=none
hi SignColumn      ctermfg=White    ctermbg=none    cterm=none
hi Folded          ctermfg=White    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=White    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=White    ctermbg=none    cterm=none
hi TabLine         ctermfg=White    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=White    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=White    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=White    ctermbg=none    cterm=none
hi Search          ctermfg=White    ctermbg=none    cterm=none
hi IncSearch       ctermfg=White    ctermbg=none    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=White    ctermbg=none    cterm=none
hi StatusLineNC    ctermfg=White    ctermbg=none    cterm=none
hi WildMenu        ctermfg=White    ctermbg=none    cterm=none
hi Question        ctermfg=White    ctermbg=none    cterm=none
hi Title           ctermfg=White    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=White    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=White    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=White    ctermbg=Blue    cterm=none
hi Visual          ctermfg=White    ctermbg=DarkGrey    cterm=none
hi VisualNOS       ctermfg=White    ctermbg=none    cterm=none
hi NonText         ctermfg=White    ctermbg=none    cterm=none

hi Todo            ctermfg=White    ctermbg=none    cterm=none
hi Underlined      ctermfg=White    ctermbg=none    cterm=none
hi Error           ctermfg=DarkRed    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=White    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=White    ctermbg=none    cterm=none
hi Ignore          ctermfg=White    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=White    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=Grey    ctermbg=none    cterm=none
hi String          ctermfg=Yellow    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=Yellow    ctermbg=none    cterm=none
hi Character       ctermfg=Yellow    ctermbg=none    cterm=none
hi Number          ctermfg=Magenta    ctermbg=none    cterm=none
hi Boolean         ctermfg=LightBlue    ctermbg=none    cterm=none
hi Float           ctermfg=Magenta    ctermbg=none    cterm=none

hi Identifier      ctermfg=White    ctermbg=none    cterm=none
hi Function        ctermfg=Green    ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=DarkMagenta    ctermbg=none    cterm=none
hi Conditional     ctermfg=DarkMagenta    ctermbg=none    cterm=none
hi Repeat          ctermfg=White    ctermbg=none    cterm=none
hi Label           ctermfg=White    ctermbg=none    cterm=none
hi Operator        ctermfg=DarkMagenta    ctermbg=none    cterm=none
hi Keyword         ctermfg=LightBLue    ctermbg=none    cterm=none
hi Exception       ctermfg=DarkRed    ctermbg=none    cterm=none
hi Comment         ctermfg=Red    ctermbg=none    cterm=none

hi Special         ctermfg=DarkYellow    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=Yellow    ctermbg=none    cterm=none
hi Tag             ctermfg=Cyan    ctermbg=none    cterm=none
hi Delimiter       ctermfg=White    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=Red    ctermbg=none    cterm=none
hi Debug           ctermfg=Blue    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=White    ctermbg=none    cterm=none
hi Include         ctermfg=DarkMagenta    ctermbg=none    cterm=none
hi Define          ctermfg=LightBLue    ctermbg=none    cterm=none
hi Macro           ctermfg=White    ctermbg=none    cterm=none
hi PreCondit       ctermfg=White    ctermbg=none    cterm=none

hi Type            ctermfg=LightBlue    ctermbg=none    cterm=none
hi StorageClass    ctermfg=White    ctermbg=none    cterm=none
hi Structure       ctermfg=LightBlue    ctermbg=none    cterm=none
hi Typedef         ctermfg=LightBlue    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=DarkGreen    ctermbg=none    cterm=none
hi DiffChange      ctermfg=DarkYellow    ctermbg=none    cterm=none
hi DiffDelete      ctermfg=DarkRed    ctermbg=none    cterm=none
hi DiffText        ctermfg=DarkCyan    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=White    ctermbg=Black    cterm=none
hi PmenuSel        ctermfg=White    ctermbg=DarkBlue    cterm=none
hi PmenuSbar       ctermfg=White    ctermbg=Black    cterm=none
hi PmenuThumb      ctermfg=White    ctermbg=DarkBlue    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=White    ctermbg=Red    cterm=none
hi SpellCap        ctermfg=White    ctermbg=Red    cterm=none
hi SpellLocal      ctermfg=White    ctermbg=Red    cterm=none
hi SpellRare       ctermfg=White    ctermbg=Red    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
