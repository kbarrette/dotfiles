" Be iMproved!
set nocompatible

set shell=/bin/sh

" Syntax highlighting on
syntax on

" ------------------
" Custom keybindings
" ------------------

" Keybindings
let mapleader=" "
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Set up tab to switch to last used buffer
nnoremap <Tab> :b#<CR>

" Select pasted text
nnoremap gp `[v`]

" Ctrl-S saves
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Delete buffers
nnoremap <leader>bd :bd<CR>


" -----------------
" Plugin management
" -----------------

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'Lokaltog/vim-easymotion'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-operator-replace' | Plug 'kana/vim-operator-user'
Plug 'mtth/scratch.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'posva/vim-vue'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/BufOnly.vim'
" Plug 'dense-analysis/ale' " TODO coc.vim can take over linting?
call plug#end()
runtime macros/matchit.vim


" -------------------------------
" Plugin customizations and setup
" -------------------------------

" jellybeans setup
" Make paren matching more subtle, Syntastic errors match other errors, Todo more prominent
let g:jellybeans_overrides = {
\  'MatchParen': { 'guifg': 'ffffff', 'ctermfg': '231', 'attr': 'underline,bold' },
\  'SyntasticError': { 'guibg': '902020', 'ctermbg': 'DarkRed' },
\  'Todo': { 'attr': 'reverse,bold' },
\}
colorscheme jellybeans

" vim-gitgutter setup
set signcolumn=yes
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" highlight link GitGutterAdd DiffAdd
" highlight link GitGutterChange DiffChange
" highlight link GitGutterDelete DiffDelete
" highlight link GitGutterChangeDelete DiffChange
highlight GitGutterAdd guifg=#437019
highlight GitGutterChange guifg=#2B5B77
highlight GitGutterDelete guifg=#700009
highlight GitGutterChangeDelete guifg=#2B5B77

" vim-airline setup
set noshowmode
" let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 32
let g:airline#extensions#branch#enabled = 0
let g:airline_section_y = ''

" YouCompleteMe setup
let g:ycm_complete_in_comments_and_strings = 1

" vim-operator-replace setup
map gr <Plug>(operator-replace)

" scratch setup
let g:scratch_filetype = 'markdown'

" Easymotion setup
" map <Leader>s <Plug>(easymotion-s)
map <Leader>S <Plug>(easymotion-S)
map <Leader>f <Plug>(easymotion-f)
map <Leader>F <Plug>(easymotion-F)
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>e <Plug>(easymotion-bd-e)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" FZF setup
nnoremap <C-P> :FZF<CR>
" nnoremap <C-L> :Buffers<CR>
nnoremap <C-L> :call fzf#vim#buffers(expand('<q-args>'), 0)<CR>
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
command -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:50%'))
noremap <leader>ag :call fzf#vim#ag(expand('<cword>'), fzf#vim#with_preview('right:50%'))<CR>
noremap <leader>s :call fzf#vim#ag(expand('<cword>'), fzf#vim#with_preview('right:50%'))<CR>
noremap <leader>rg :execute('Rg '.expand('<cword>'))<CR>

" vim-vue setup
autocmd FileType vue syntax sync fromstart

" coc.nvim setup
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> <C-]> <Plug>(coc-definition)
let g:LanguageClient_serverCommands = { 'vue': ['vls'] }

" ale setup
" let g:ale_linters = {
" \  'javascript': [],
" \  'vue': [],
" \}
" let g:ale_ruby_rubocop_executable = 'bundle'

" ----------------------------
" Colors, display options, etc
" ----------------------------

" Enable filetype-specific plugins and indenting
filetype plugin indent on

" Show line number
set number

" set relativenumber
" autocmd InsertEnter * :set number | set norelativenumber
" autocmd InsertLeave * :set relativenumber | set nonumber

" Highlight cursor line
set cursorline

" Show row and column
set ruler

" Set encoding to a sensible UTF-8
set encoding=utf-8

" Always show status line
set laststatus=2

" Show some info about the current command
set showcmd

" Speed up big files
set synmaxcol=1024

" Don't continue comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show $ at end of change
" set cpoptions+=$

" Fenced markdown languages
let g:markdown_fenced_languages = ['erb=eruby', 'javascript', 'json=javascript', 'ruby', 'html']

" *.jb is ruby
autocmd BufRead,BufNewFile *.jb set filetype=ruby

" GUI setup
if has('gui_running')
  if has("win32") || has("win16")
    set guifont=Inconsolata:h12
  else
    set guifont=Inconsolata\ for\ Powerline:h15

  endif

  " Remove left and right scrollbars
  set guioptions-=L
  set guioptions-=r

" Terminal setup
else
  set t_Co=256
endif

" --------------------
" General vim behavior
" --------------------

" Use host OS clipboard
set clipboard=unnamedplus

" Ignore case in searches unless there are upper-case characters in the search
set ignorecase
set smartcase

" Search incrementally
set incsearch

" Use wildmenu
set wildmenu
set wildmode=list:longest

" Live dangerously - turn off backups
set nobackup
set nowritebackup
set noswapfile

" Don't warn about unsaved buffers
set hidden

" Whitespace
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2
set copyindent


" ---------------
" Custom commands
" ---------------

" Retain window position when switching buffers
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Highlight extraneous whitespace
autocmd BufWinEnter * match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Reformat entire file
nnoremap <leader>fa ggVG=

" Reformat paragraph
nnoremap <leader>fp vap=

" Bufonly
nnoremap <leader>bo :Bufonly<CR>


" -----------
" Experiments
" -----------
if has("termguicolors")
  set termguicolors
endif

set breakindent
set colorcolumn=80
set splitbelow
set splitright
set nohlsearch
nnoremap <silent> <C-J> :wincmd w<CR>
nnoremap <silent> <C-K> :wincmd W<CR>

set tags=.tags
set path=.

set foldmethod=indent
set foldlevelstart=99

nnoremap <leader>rd :redraw!<CR>

nnoremap <leader>cp :let @*=expand("%")<CR>

nnoremap <leader>rh :syntax sync fromstart<CR>

nnoremap <silent> <C-N> :set relativenumber<CR>:sleep 500m <bar> set norelativenumber<CR>
augroup HiglightTODO
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END
