let g:hybrid_transparent_background = 1

syntax on
set background=dark
colorscheme hybrid_material


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
