let g:plug_window = 'noautocmd vertical topleft new'
call plug#begin('~/.vim/plugged')

"{{ Themes }}
    Plug 'kristijanhusak/vim-hybrid-material'
"{{ The Basics }}
"   Plug 'itchyny/lightline.vim'                       " Lightline statusbar

    Plug 'vim-airline/vim-airline'			  "Airline
    Plug 'vim-airline/vim-airline-themes'
    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
    Plug 'frazrepo/vim-rainbow'
    Plug 'moll/vim-bbye'
    "{{ File management }}
    Plug 'vifm/vifm.vim'                               " Vifm
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity }}
    Plug 'vimwiki/vimwiki'                             " VimWiki 
    Plug 'jreybert/vimagit'                            " Magit-like plugin for vim
    Plug 'mhinz/vim-startify'                          " A start screen for Vim
    Plug 'tpope/vim-commentary'                        " Toggle comments with / key
    Plug 'ChristianChiarulli/codi.vim'		"an interactive scratchpad for hackers
"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                          " Change surrounding marks
"{{ Syntax Highlighting and Colors }}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plug 'vim-python/python-syntax'                    " Python highlighting
    Plug 'ap/vim-css-color'                            " Color previews for CSS
    Plug 'sheerun/vim-polyglot'			" A collection of language packs for Vim.
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'junegunn/rainbow_parentheses.vim'
    
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next','do': 'bash install.sh'}
"{{ Search }}
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'airblade/vim-rooter'
"{{ Junegunn Choi Plugins }}
    Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

call plug#end()



