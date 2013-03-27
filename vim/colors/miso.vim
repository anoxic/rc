" Vim Colorfile

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "miso"


" Settings

hi LineNr ctermfg=black         " Make the line numbers very dark
hi SignColumn ctermbg=none      " Remove sign column bg
