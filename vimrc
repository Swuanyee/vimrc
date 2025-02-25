" Basic settings
set termguicolors             " Set true color
set nocompatible              " Disable compatibility with old versions of Vim, enables features that are not available in Vi
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
filetype on                   " Enable file type detection
set autoindent                " Enable automatic indentation
runtime macros/matchit.vim    " Enable matchit.vim for extended % matching, e.g HTML tags
filetype plugin on            " Enable file type plugins
set backspace=indent,eol,start " Configure backspace to work more naturally
set tags=./tags;,tags;        " Set tags file path, search in current and parent directories
cnoreabbrev fzf FZF           " Abbreviate 'fzf' to 'FZF' in command mode
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Enable bracketed paste mode when using tmux or screen
" This is needed because, without bracketed paste mode,
" pasting text can mess up the formatting by triggering
" unexpected commands or indentation. Bracketed paste mode
" helps to handle pasted text correctly.
if &term =~ "screen" || &term =~ "tmux"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif

" Initialize plugin system (vim-plug)
call plug#begin()
Plug 'preservim/nerdtree'	    " File explorer
Plug 'github/copilot.vim'		" GitHub Copilot
Plug 'preservim/tagbar'		    " Tagbar
Plug 'dense-analysis/ale'       " Asynchronous linting/fixing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder with installation command
Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Intellisense engine for Vim
Plug 'ghifarit53/tokyonight-vim' " Tokyo night theme
Plug 'sainnhe/everforest'       " Everforest theme
Plug 'mfussenegger/nvim-jdtls'  " Java Development Tools Language Server
call plug#end()

"Nerdtree Configuration 
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Shortcut for TagbarToggle
nmap <F8> :TagbarToggle<CR>

" Python syntax highlighting and related settings
let python_highlight_all=1    " Enable full Python syntax highlighting
syntax on                     " Enable syntax highlighting

" ALE (Asynchronous Lint Engine) settings
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'javascript': ['eslint'],
\   '*': [
\       'trim_whitespace',
\       'remove_trailing_lines'
\   ]
\}
" Use autopep8 for Python files
" Use eslint for JavaScript files
" Trim trailing whitespace
" Remove trailing lines

let g:ale_sign_error = '>>'      " Set error sign
let g:ale_sign_warning = '⚠'     " Set warning sign
let g:ale_disable_lsp = 1        " Disable ALE's built-in LSP

" Key mappings and commands
nnoremap gp :silent %!prettier --stdin-filepath %<CR> " Format file with Prettier on 'gp'
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile') " Command to format file with Prettier

" Everforest colorscheme
set background=dark
colorscheme everforest

" coc.nvim settings
" Function to find the nearest 'venv' directory and return the path to its 'python3' interpreter
function! FindPythonVenv()
  let l:dir = finddir('venv', '.;')
  if !empty(l:dir)
    return l:dir . '/bin/python3'
  endif
  return 'python3'
endfunction

" Autocommand to dynamically set the Python path for 'coc.nvim' when a Python file is opened
autocmd BufEnter *.py let g:coc_user_config = {
\ 'python.pythonPath': FindPythonVenv(),
\ }

" Enable LSP servers for C, Kotlin, Swift, and Java
let g:coc_global_extensions = [
\ 'coc-clangd',
\ 'coc-kotlin',
\ 'coc-sourcekit',
\ 'coc-java'
\]

" LSP configuration for coc.nvim
" Key mappings for LSP
nmap <silent> gd <Plug>(coc-definition)       " Go to definition
nmap <silent> gD <Plug>(coc-declaration)      " Go to declaration
nmap <silent> gr <Plug>(coc-references)       " Find references
nmap <silent> gi <Plug>(coc-implementation)   " Go to implementation
nmap <silent> K :call CocActionAsync('doHover')<CR>  " Hover for information
nmap <silent> <leader>rn <Plug>(coc-rename)   " Rename symbol

" Use CocAction to format file with Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Clear clipboard registers (optional)
" :let @" = ''
" :let @+ = ''

" coc-explorer settings
nnoremap <F10> :CocCommand explorer<CR>

" nvim-jdtls settings
let g:jdtls_path = expand('~/.local/share/nvim/mason/packages/jdtls')
let g:jdtls_workspaces = '~/workspace'

" Java key mappings for nvim-jdtls
nmap <silent> <leader>o :lua require('jdtls').organize_imports()<CR>
nmap <silent> <leader>v :lua require('jdtls').extract_variable()<CR>
nmap <silent> <leader>c :lua require('jdtls').extract_constant()<CR>
vmap <silent> <leader>m :lua require('jdtls').extract_method(true)<CR>
