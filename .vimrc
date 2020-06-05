call plug#begin() "vim-plug ------------------------------------------------------------------------

Plug 'w0rp/ale'
Plug '/user/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ludovicchabant/vim-gutentags'
Plug 'integralist/vim-mypy'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end() "end vim-plug ----------------------------------------------------------------------

"global/standard stuff
    syntax enable
    syntax on
    set t_Co=256

    "set background=light
    set background=dark
	  colorscheme cosmic_latte

    filetype plugin indent on
    set number
    set showcmd
    set cursorline
    set lazyredraw
    set showmatch
    set hlsearch incsearch
    set noeb vb t_vb=
    set foldmethod=indent
    set foldlevelstart=99
    set wildmenu
    set cc=121
    set backspace=indent,start
    set tags=tags
    set ignorecase
    set smartcase
	  "parenthesis highlighting color
    highlight LineNr ctermfg=black
    highlight MatchParen cterm=bold ctermbg=black ctermfg=red
    silent! execute "/ $"
    let mapleader=","

    " Create window splits easier. The default
    " way is Ctrl-w,v and Ctrl-w,s. I remap
    " this to vv and ss
    nnoremap <silent> vv <C-w>v
    nnoremap <silent> ss <C-w>s
    " Easier navigation between split windows
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    "security hole
    set modelines=0
    set nomodeline

"indentation
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab

"language-dependent indentation
  "python
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
  "csharp
    autocmd FileType csharp set tabstop=4
    autocmd FileType csharp set softtabstop=4
    autocmd FileType csharp set shiftwidth=4
  "go
    autocmd FileType go set tabstop=4
    autocmd FileType go set softtabstop=4
    autocmd FileType go set shiftwidth=4
    autocmd FileType go set noexpandtab

    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1
    let g:go_auto_sameids = 1
    let g:go_addtags_transform = "camelcase"

  "elm
    autocmd FileType elm set syntax=elm

"custom mappings
    "ctrl-d is like dd inside insert mode
    imap <c-d> <esc>ddi

    "ctrl-e jumps to the end of the line while in insert mode
    imap <c-e> <esc>A
    imap <c-b> <esc>^i

    "s inserts a single character from normal mode
    nnoremap s i_<Esc>r

    "// searches for entire highlighted text (finnicky)
    vnoremap // y/\V<c-r>"<cr>

    "ctrl-b flips boolean value
    "noremap <c-b> :call funcs#ToggleBool()<cr>

    "jump to last buffer
    nnoremap <Leader>b :bp<CR>

"netrw settings
  let g:netrw_liststyle=3

"fuzzy finder
  set rtp+=/usr/local/opt/fzf
  nnoremap <Leader>ff :GitFiles<CR>
  nnoremap <Leader>fb :Buffers<CR>
  nnoremap <Leader>fa :Ag<Space>
  nnoremap <C-p> :GitFiles<CR>

" File tree browser - backslash
map \ :NERDTreeToggle<CR>
" File tree browser showing current file - pipe
map \| :NERDTreeFind<CR>
" Ignore files in nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '^node_modules', '\.log$', 'public\/system',
      \ 'javascripts\/bundle', '^spec\/dummy', '^bower_components', '\.git',
      \ '\.DS_Store', '\.vscode', '__pycache__', '^tags', '^tags.lock$',
      \ '^tags.temp$', '^coverage', '^build\/', '__init__.py']

"ale linters
  let g:ale_linters = {
  \   'ruby': ['rubocop'],
  \   'python': ['flake8'],
  \}
  nnoremap <Leader>aj :ALENext<cr>
  nnoremap <Leader>ak :ALEPrevious<cr>

"stuff for govim
  set nocompatible
  set nobackup
  set nowritebackup
  set noswapfile
