call plug#begin('~/dotfiles/config/nvim/plugged')

" COLORSCHEMES "
Plug 'junegunn/seoul256.vim'

" UTILITIES "
Plug 'vim-airline/vim-airline'
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

" SYNTAX "
Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'

" AUTOCOMPLETE "
Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'} 

call plug#end()

" augroup load_plug
" 	autocmd!
" 	autocmd InsertEnter * call plug#load('YouCompleteMe')
" 				\| autocmd! load_plug
" augroup END

"==========Python Directory========="
let g:python_host_prog='/usr/local/bin/python'
let g:python3_host_prog='/usr/local/bin/python3.6'

"==============SETTINGS============="
set encoding=utf8
set number
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
set completeopt+=noselect,menuone,longest
set completeopt-=preview
set lazyredraw
set cursorline
" set clipboard=unnamed
set wildignorecase
" set backspace=indent,eol,start
set dir=~/.config/nvim/backups
let g:netrw_dirhistmax=0

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
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

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
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:working_path_mode='ra'

" Syntastic "
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_cpp_checkers = ['gcc']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" YCM "
let g:ycm_register_as_syntastic_checker=0
let g:ycm_python_binary_path = '/usr/local/bin/python3.6'

" Neomake "
" autocmd! BufWritePost * Neomake
" let g:neomake_cpp_enable_makers = ['clang']
" let g:neomake_cpp_clang_maker = {
			" \ }
" let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_python_flake8_maker = {
    " \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    " \ 'errorformat':
        " \ '%E%f:%l: could not compile,%-Z%p^,' .
        " \ '%A%f:%l:%c: %t%n %m,' .
        " \ '%A%f:%l: %t%n %m,' .
        " \ '%-G%.%#',
    " \ }

" Compile and Run "
autocmd filetype cpp nnoremap <F8> :w<cr>:lcd %:p:h<cr>:te g++ -std=c++11 % -o%< && ./%<<cr>
autocmd filetype c nnoremap <F8> :w<cr>:lcd %:p:h<cr>:te gcc % -o%< && ./%<<cr>
autocmd filetype python nnoremap <F8> :w<cr>:lcd %:p:h<cr>:te python3 %<cr>

" function! BuildProject()
" 	set makeprg=build.sh
" 	silent make
" 	copen
" 	echo "Build Complete"
" endfunction
" nnoremap <c-m> :call BuildProject()<CR>
" nnoremap <c-n> :cn<CR>
" nnoremap <c-p> :cp<CR>
