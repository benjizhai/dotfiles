nnoremap <SPACE> <Nop>

" Better nav on Colemak DH
nnoremap l h
nnoremap h l
nnoremap j k
nnoremap k j

xnoremap l h
xnoremap h l
xnoremap j k
xnoremap k j

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" New split windows
map <Leader>wd <C-w>s
map <Leader>wr <C-w>v
" Close window
map <Leader>wc <C-w>c
" Close buffer (need bbye plugin)
map <Leader>wq :Bdelete<CR> 
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>wh <C-w>t<C-w>H
map <Leader>wv <C-w>t<C-w>K

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-l> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-j> <C-w>k
nnoremap <C-h> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Open terminal within vim
map <Leader>tt :vnew term://zsh<CR>i
" Double escape from terminal buffer
tnoremap <silent> <Leader>qq <C-\><C-n>:bd!<CR>
" Enter terminal normal mode
tnoremap <silent> <Leader>tn <C-\><C-n>



" Better nav for omnicomplete
"inoremap <expr> <c-j> ("\<C-n>")
"inoremap <expr> <c-k> ("\<C-p>")



" Better tabbing
vnoremap < <gv
vnoremap > >gv


" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"








" fuzzy
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

