call plug#begin('~/dotfiles/config/nvim/plugged')

" COLORSCHEMES "
Plug 'junegunn/seoul256.vim'

" UTILITIES "
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'benmills/vimux'
Plug 'sickill/vim-pasta'

" SYNTAX "
Plug 'scrooloose/syntastic', {'on':[]}

" AUTOCOMPLETE "
Plug 'Valloric/YouCompleteMe', {'on':[]}
"Plug 'rdnetto/YCM-Generator'

call plug#end()

augroup load_plug
	autocmd!
	autocmd InsertEnter * call plug#load('syntastic')
				\| autocmd! load_plug
augroup END

"==============SETTINGS============="
set encoding=utf8
set number
set wrap
set wrapmargin=8
set linebreak
set autoindent
set smartindent
set laststatus=2 "always display status line
set mouse=a "enable mouse
set history=1000
set textwidth=120
set noexpandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set completeopt+=longest
set lazyredraw
set cursorline
set clipboard=unnamed
set dir=~/.config/nvim/backups

"=============KEYBINDINGS==========="
let mapleader = ' '
let g:mapleader = ' '
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap jk <esc>
nnoremap <leader>v :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>n :tabnew<cr>
nnoremap <leader>0 0gt
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

nnoremap <silent> <leader>c :Commentary<cr>
nnoremap <leader>q <c-w>z

" color schemes and airline "
colorscheme seoul256
" if strftime("%H") < 9
" Range: 252 (darkest) ~ 256 (lightest)
" Default: 253
	" let g:seoul256_background=255
	" let g:airline_theme='papercolor'
	" set background=light
" else
" Range: 233 (darkest) ~ 239 (lightest)
" Default: 237
	let g:seoul256_background=235
	set background=dark
" endif
syntax enable
let g:airline_powerline_fonts=1
" let g:airline_theme='oceanicnext'
let g:airline_theme='base16'
