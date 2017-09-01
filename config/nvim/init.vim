call plug#begin('~/dotfiles/config/nvim/plugged')

" COLORSCHEMES "
Plug 'junegunn/seoul256.vim'

" UTILITIES "
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " gBrowse
Plug 'junegunn/gv.vim'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'sickill/vim-pasta'
Plug 'kien/ctrlp.vim', {'on': ['CtrlP']}
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'qpkorr/vim-bufkill'

" SYNTAX "
" Plug 'scrooloose/syntastic'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

" AUTOCOMPLETE "
Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

call plug#end()

augroup load_plug
	autocmd!
	autocmd InsertEnter * call plug#load('YouCompleteMe')
				\| autocmd! load_plug
augroup END

"==========Python Directory========="
" let g:python_host_prog='/usr/local/bin/python'
" let g:python3_host_prog='/usr/local/bin/python3.6'

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
set noexpandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set completeopt+=noselect,menuone,longest
set completeopt-=preview
" set termguicolors
" set lazyredraw
set cursorline
" set clipboard=unnamed
set wildignorecase
set nohlsearch
set backspace=indent,eol,start
" set spell
set dir=~/.config/nvim/backups
let g:netrw_dirhistmax=0

"=============KEYBINDINGS==========="
let mapleader = ' '
let g:mapleader = ' '
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
nnoremap <C-C> :BD<cr>
map 0 ^

nnoremap <silent> <leader>c :Commentary<cr>
nnoremap <leader>q <c-w>z
nnoremap <silent> <leader>p :CtrlP<cr>
nnoremap <silent> <leader>t :TagbarToggle<CR>

" color schemes and airline "
" Light
" Range: 252 (darkest) ~ 256 (lightest)
" Default: 253
" Dark
" Range: 233 (darkest) ~ 239 (lightest)
" Default: 237

filetype plugin indent on
syntax enable
colorscheme seoul256
let g:seoul256_background=234
set background=dark

" let g:airline_theme='base16'
" let g:airline_powerline_fonts=0

" set statusline=%F\ %m%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%)\ %P
let g:lightline = {
			\ 'active': {
			\	'left': [ ['mode', 'paste'], ['filename', 'modified'] ],
			\	'right': [ ['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'] ]
			\ },
			\ 'inactive': {
			\	'left': [ ['filename'] ],
			\	'right': [ ['percent'] ],
			\ },
			\ 'colorscheme': 'seoul256',
			\ 'component_expand': {
			\	'linter_warnings': 'LightlineLinterWarnings',
			\	'linter_errors': 'LightlineLinterErrors',
			\	'linter_ok': 'LightlineLinterOK'
			\ },
			\ 'component_type': {
			\	'readonly': 'error',
			\	'linter_warnings': 'warning',
			\	'linter_errors': 'error'
			\ },
			\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call lightline#update()

hi! StatusLine ctermbg=white ctermfg=236

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

" YCM "
" let g:ycm_python_binary_path = '/usr/local/bin/python3.6'
let g:ycm_global_ycm_extra_conf = '~/dotfiles/config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" Neomake "
"autocmd! BufWritePost * Neomake
"let g:neomake_cpp_enable_makers = ['clang']
"let g:neomake_cpp_clang_maker = {
			"\ 'args': ['-Wall', '-Wextra', '-Weverything', '-pedantic'],
			"\ }
"let g:neomake_python_enabled_makers = ['flake8']
"let g:neomake_python_flake8_maker = {
    "\ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202,E501,W291,E302,E301,W293,E265',  '--format=default'],
    "\ 'errorformat':
        "\ '%E%f:%l: could not compile,%-Z%p^,' .
        "\ '%A%f:%l:%c: %t%n %m,' .
        "\ '%A%f:%l: %t%n %m,' .
        "\ '%-G%.%#',
    "\ }

"hi! NeomakeErrorSign ctermfg=white ctermbg=235 guibg=gray20
"hi! NeomakeError cterm=underline ctermfg=white

" ale "
let g:ale_sign_warning = '◆'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_python_flake8_args="--ignore=E501,E265,E221,W293"

" Compile and Run "
autocmd filetype cpp nnoremap <F8> :w<cr>:lcd %:p:h<cr>:vs<cr>:te g++ -std=c++11 % -o%< && ./%<<cr>
autocmd filetype c nnoremap <F8> :w<cr>:lcd %:p:h<cr>:vs<cr>:te gcc % -o%< && ./%<<cr>
autocmd filetype python nnoremap <F8> :w<cr>:lcd %:p:h<cr>:vs<cr>:te python3 %<cr>

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" strip white space "
" autocmd BufWritePre * %s/\s\+$//e

map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

hi! VertSplit ctermfg=236 ctermbg=235 cterm=bold
