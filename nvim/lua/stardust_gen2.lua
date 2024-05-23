local Groups = require 'highlite.groups' --- @type highlite.Groups
local Highlite = require 'highlite' --- @type Highlite
local Palette = require 'highlite.color.palette' --- @type highlite.color.Palette

--[[ Generate Palette
  NOTE: this section shows using `derive`, but you can also use one of the builtin palettes.
        See "Generating a Palette" for more information.
]]

local black         = '#000000'
local gray_dark     = '#1c1c1c'
local gray_mid      = '#262626'
local gray_light    = '#767676'
local gray          = '#808080'
local white_dark    = '#c6c6c6'
local white         = '#ebebeb'
local bright        = '#ffffff'

local red_dark      = '#870000'
local red           = '#ff2b32'
local red_light     = '#ff595f'
local reddish_pink  = '#ff0a48'
local pink          = '#ff0087'

local orange_mid    = '#ff7b00'
local orange        = '#ffaf00'
local yellow_dark   = '#938200'
local yellow        = '#ffff00'

local green_dark    = '#008000'
local green         = '#29d10c'
local green_light   = '#00ff00'

local blue_dark     = '#005285'
local blue_mid      = '#5f5fff'
local blue          = '#10a4ff'
local blue_light    = '#5cc1ff'

local turqoise_dark = '#008080'
local turqoise      = '#22bcb7'
local teal          = '#00afd7'
local cyan          = '#00ffff'

local magenta       = '#ff00ff'

local purple        = '#d75fff'

local bg = vim.api.nvim_get_option 'background' -- get the background
local palette = Palette.derive(bg, bg == 'dark' and {
     bg = black, -- the background color
     bg_contrast_high = white_dark, 	-- an accent to the bg color which contrasts
     bg_contrast_low = gray_dark, -- an accent to the bg color which barely contrasts
     boolean = cyan, -- true and false
     character = orange, -- character literals (e.g. 'a')
     character_special = orange_mid, -- special characters e.g. wildcards
     class = reddish_pink, -- data with behavior
     comment = gray, -- normal comments
     comment_special = bright, -- special tokens in a comment
     conditional = green_light, -- e.g. if, match, switch
     constant = white_dark, -- constant values
     constant_builtin = white, -- built-in constant values
     decorator = yellow, --
     define = blue_light, -- e.g. #define in C
     diff_add = green_light, -- added text
     diff_change = orange, -- changed text, also applies to modified buffers in the tabline
     diff_delete = red, -- removed text
     error = red, -- diagnostic errors
     field = white_dark, -- a member of a class/struct which is accessed directly
     float = purple, -- floating point numbers
     fold = gray, -- the background of &foldtext
     func = blue, -- functions, e.g. print('a')
     hint = gray, -- diagnostic hints
     identifier = white_dark, -- misc. identifier
     include = reddish_pink, -- e.g. #include in C
     info = gray_light, -- diagnostic info
     keyword = red, -- keywords, e.g. local in Lua
     label = white, -- switch cases, loop labels (e.g. 'outer for x in y { break 'outer } in Rust)
     loop = green_light, -- e.g. loop, for, while
     macro = blue_mid, -- e.g. println! in Rust
     message = yellow, -- Builtin Vim messages
     number = purple, -- number literals (e.g 9)
     ok = green, -- positive reinforcement from LSP or Git
     operator = cyan, -- e.g. +, -, &&
     parameter = white, -- a function parameter
     preproc = blue_light, -- pre-processor commands (e.g. #[derive] in Rust)
     preproc_conditional = yellow, -- pre-processor conditionals (e.g. #[cfg] in Rust)
     property = white_dark, -- a member of a class or structure which is transparently a function
     punctuation = white, -- misc. delimiters
     search = yellow, -- Doing :/ or :s/
     select = blue_dark, -- selected text, e.g. in visual mode or selecting LSP completions
     statement = pink, -- programming language statements which do not fall into another category
     storage = cyan, -- pointer symbols (e.g. &foo)
     string = orange, -- a misc. string
     string_escape = orange_mid, -- escaped characters in a string
     syntax_error = red_dark, -- non-diagnostic errors; sometimes shown in the actual highlighting of the code you write
     tag = blue_light, -- XML/HTML tags
     tag_attribute = white_dark, -- XML/HTML tag attributes
     tag_delimiter = gray, -- </> in XML/HTML tags
     text = white_dark, -- plaintext
     text_reference = blue_light, -- references to variables in text
     throw = reddish_pink, -- a keyword which triggers or receives errors (e.g. throw MyError)
     todo = yellow, -- TODO comments
     type = reddish_pink, -- type names e.g. int, String
     type_builtin = reddish_pink, -- a type from the standard library
     type_parameter = reddish_pink, -- generic type
     uri = blue_light, -- links (HTTP, tags, match paren, etc).
     variable = white, -- a variable
     variable_builtin = white_dark, -- a variable from the language, e.g. self
     warning = orange, -- diagnostic warnings
} or {
  -- light palette goes here
})

--- NOTE: this part is optional!
--- @type highlite.color.palette.terminal
local terminal_palette = {
  '#000000', '#ff2b32', '#29d10c', '#10a4ff', '#f6c100', '#ff4faa', '#22bcb7', '#d2d2d2',
  '#7f8c8d', '#ff4a50', '#3cff1a', '#58caff', '#ffdf25', '#ff8ffa', '#49e0db', '#ffffff',
}

--[[ Generate Groups ]]
local groups = Highlite.groups('default', palette)

--[[ Group Overrides ]]
groups['@keyword'] = {fg = palette.keyword, bold = true}
groups['@keyword.function'] = {fg = palette.keyword, bold = true}
groups['@keyword.conditional'] = {fg = palette.conditional, bold = true}
groups['@keyword.repeat'] = {fg = palette.loop, bold = true}
groups['@function.builtin'] = {fg = palette.func, bold = true}
groups['@comment'] = {fg = palette.comment, italic = true}

--[[ Generate ]]
Highlite.generate('stardust_gen2', groups, terminal_palette)
