" Based on the PaperColor framework

fun! PaperColor_stardust#register()
  let g:PaperColor_stardust = {
         \   'maintainer'  : 'skylineone044',
         \   'source' : 'soon',
         \   'description' : 'Dark & vibrant',
         \   'options' : {
         \       'transparent_background': 1,
         \       'allow_bold': 1
         \  }
         \ }

  let g:PaperColor_Theme_Options = {
         \   'language': {
         \     'python': {
         \       'highlight_builtins' : 1
         \     },
         \     'cpp': {
         \       'highlight_standard_library': 1
         \     },
         \     'c': {
         \       'highlight_builtins' : 1
         \     }
         \   }
         \ }

  let g:PaperColor_stardust.dark = {
         \ 'palette': {
         \   'color00' : ['#000000', '0'],
         \   'color01' : ['#ff0000', '9'],
         \   'color02' : ['#00ff00', '10'],
         \   'color03' : ['#ffaff0', '214'],
         \   'color04' : ['#000000', '0'],
         \   'color05' : ['#808080', '8'],
         \   'color06' : ['#00d700', '40'],
         \   'color07' : ['#ffffff', '15'],
         \   'color08' : ['#000000', '0'],
         \   'color09' : ['#ff0087', '198'],
         \   'color10' : ['#ff005f', '197'],
         \   'color11' : ['#00ff00', '46'],
         \   'color12' : ['#00afff', '39'],
         \   'color13' : ['#ff00ff', '201'],
         \   'color14' : ['#00afff', '39'],
         \   'color15' : ['#ffff00', '226'],
         \   'color16' : ['#00afff', '39'],
         \   'color17' : [' #00ffff', '51'],
         \   'cursorline' : ['#262626', '235'],
         \   'cursorlinenr_fg' : ['#0087ff', '39'],
         \   'cursorlinenr_bg' : ['#1c1c1c', '234'],
         \   'popupmenu_fg' : ['#ffffff', '15'],
         \   'popupmenu_bg' : ['#262626', '235'],
         \   'search_fg' : ['#000000', '0'],
         \   'search_bg' : ['#ffff00', '226'],
         \   'linenumber_fg' : ['#afaf87', '244'],
         \   'linenumber_bg' : ['#000000', '0'],
         \   'vertsplit_fg' : ['#ffffff', '15'],
         \   'vertsplit_bg' : ['#000000', '0'],
         \   'statusline_active_fg' : ['#ffffff', '15'],
         \   'statusline_active_bg' : ['#000000', '0'],
         \   'statusline_inactive_fg' : ['#767676', '243'],
         \   'statusline_inactive_bg' : ['#303030', '236'],
         \   'todo_bg' : ['#ff00ff', '201'],
         \   'todo_fg' : ['#ffffff', '15'],
         \   'error_fg' : ['#ffffff', '15'],
         \   'error_bg' : ['#af0000', '124'],
         \   'matchparen_bg' : ['#6c6c6c', '242'],
         \   'matchparen_fg' : ['#ffffff', '15'],
         \   'visual_fg' : ['#ffffff', '15'],
         \   'visual_bg' : ['#870000', '88'],
         \   'folded_fg' : ['#ffffff', '15'],
         \   'folded_bg' : ['#8a8a8a', '239'],
         \   'spellbad' : ['#ff0087', '198'],
         \   'wildmenu_fg' : ['#ffffff', '15'],
         \   'wildmenu_bg' : ['#00afff', '39'],
         \  }
         \ }
endfun

