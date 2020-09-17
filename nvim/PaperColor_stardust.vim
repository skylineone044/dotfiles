" Based on the PaperColor framework

fun! PaperColor_stardust#register()
  let g:PaperColor_stardust = {
         \   'maintainer'  : 'skylineone044',
         \   'source' : 'soon',
         \   'description' : 'Dark & vibrant',
         \   'options' : {
         \       'transparent_background': 1,
         \       'allow_bold': 1,
         \       'allow_italic': 1
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
         \   'color03' : ['#ffaf00', '214'],
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
         \   'cursorlinenr_fg' : ['#ffffff', '15'],
         \   'cursorlinenr_bg' : ['#1c1c1c', '234'],
         \   'popupmenu_fg' : ['#ffffff', '15'],
         \   'popupmenu_bg' : ['#3a3a3a', '237'],
         \   'search_fg' : ['#000000', '0'],
         \   'search_bg' : ['#ffff00', '226'],
         \   'linenumber_fg' : ['#808080', '244'],
         \   'linenumber_bg' : ['#000000', '0'],
         \   'vertsplit_fg' : ['#ffffff', '15'],
         \   'vertsplit_bg' : ['#000000', '0'],
         \   'statusline_active_fg' : ['#ffffff', '15'],
         \   'statusline_active_bg' : ['#000000', '0'],
         \   'statusline_inactive_fg' : ['#767676', '243'],
         \   'statusline_inactive_bg' : ['#262626', '235'],
         \   'todo_bg' : ['#ff00ff', '201'],
         \   'todo_fg' : ['#ffffff', '15'],
         \   'error_fg' : ['#ffffff', '15'],
         \   'error_bg' : ['#af0000', '124'],
         \   'matchparen_bg' : ['#6c6c6c', '242'],
         \   'matchparen_fg' : ['#ffffff', '15'],
         \   'visual_fg' : ['#ffffff', '15'],
         \   'visual_bg' : ['#870000', '88'],
         \   'folded_fg' : ['#ffffff', '15'],
         \   'folded_bg' : ['#4e4e4e', '239'],
         \   'spellbad' : ['#ff0000', '196'],
         \   'wildmenu_fg' : ['#ffffff', '15'],
         \   'wildmenu_bg' : ['#00afff', '39'],
         \   'diffadd_fg' : ['#ffffff', '15'],
         \   'diffadd_bg' : ['#008000', '2'],
         \   'diffdelete_fg' : ['#ffffff', '15'],
         \   'diffdelete_bg' : ['#800000', '1'],
         \   'difftext_fg' : ['#ffffff', '15'],
         \   'difftext_bg' : ['#008080', '6'],
         \   'diffchange_fg' : ['#ffffff', '15'],
         \   'diffchange_bg' : ['#afaf00', '142'],
         \   'tabline_bg' : ['#000000', '0'],
         \   'tabline_active_fg' : ['#ffffff', '252'],
         \   'tabline_active_bg' : ['#00afff', '39'],
         \   'tabline_inactive_fg' : ['#bcbcbc', '250'],
         \   'tabline_inactive_bg' : ['#1c1c1c', '234'],
         \  }
         \ }
endfun

