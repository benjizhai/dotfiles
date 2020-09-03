" benji's nvim config

set nocompatible              " be iMproved, required
filetype off                  " required

" -- Settings -- Must be sourced before everything else!!
source $HOME/.config/nvim/general/settings.vim

" -- Plugins --
source $HOME/.config/nvim/vim-plug/plugins.vim

" -- Key Mappings --
source $HOME/.config/nvim/keys/mappings.vim

" -- Themes --
"source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/hybrid_material.vim

source $HOME/.config/nvim/themes/airline.vim

" -- Plug Configs --
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/language-client.vim
"lua require'plug-colorizer'
source $HOME/.config/nvim/plug-config/rainbow_parentheses.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/leaderf.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/codi.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/vifm.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/instant-markdown.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright


" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar






