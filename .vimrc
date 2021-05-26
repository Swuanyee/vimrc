set nocompatible
set number
filetype on
colorscheme murphy
set autoindent
set clipboard=unnamedplus
runtime macros/matchit.vim
filetype plugin on

cnoreabbrev fzf FZF

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'valloric/python-indent'
Plug 'scrooloose/syntastic'
Plug 'andviro/flake8-vim'
call plug#end()

let python_highlight_all=1
syntax on
let g:zenburn_high_Contrast = 1
color zenburn

let g:ale_fixers = {
\	'python':['autopep8'],
\	'javascript':['eslint'],
\	'*':[
\	'trim_whitespace',
\	'remove_trailing_lines',
\	]
\}

let ale_sign_error = '>>'
let g:ale_sign_warning = '⚠'
let g:ale_disable_lsp = 1

nnoremap gp :silent %!prettier --stdin-filepath %<CR>
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
