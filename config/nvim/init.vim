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
Plug 'tpope/vim-rhubarb' " gBrowse
Plug 'benmills/vimux'
Plug 'sickill/vim-pasta'
Plug 'kien/ctrlp.vim', {'on': ['CtrlP']}
Plug 'rking/ag.vim'
Plug 'nathanaelkane/vim-indent-guides'

" SYNTAX "
Plug 'scrooloose/syntastic', {'on':[]}

" AUTOCOMPLETE "
Plug 'Valloric/YouCompleteMe', {'on':[], 'do':'./install.py'}
"Plug 'rdnetto/YCM-Generator'

call plug#end()

augroup load_plug
	autocmd!
	autocmd InsertEnter * call plug#load('syntastic', 'YouCompleteMe')
				\| autocmd! load_plug
augroup END

"==============SETTINGS============="
set encoding=utf8
set number
" set wrap
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
set completeopt+=noselect,menuone,preview
set lazyredraw
set cursorline
set clipboard=unnamed
set wildignorecase
set backspace=indent,eol,start
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
nnoremap <silent> <leader>p :CtrlP<cr>

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

" ctrlp "
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_custom_ignore={
			\ 'dir': '\.git$\|public$|log\|tmp$',
			\ 'file': '\.DS_Store$'
			\}
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:working_path_mode='ra'

" Compile and Run
autocmd filetype cpp nnoremap <F8> :w<CR>:!g++ -std=c++11 % -o%< && ./%<<CR>
autocmd filetype c   nnoremap <F8> :w<CR>:!gcc % -o%< && ./%<<CR>
autocmd filetype python nnoremap <F8> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype arduino nnoremap <F8> :w<CR>:!processing-java --sketch=./% --run<CR>
