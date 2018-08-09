"vim-plug ----------------------------------------------------------------------
call plug#begin()

Plug '/user/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ludovicchabant/vim-gutentags'
" true True false False

call plug#end()
"end vim-plug ------------------------------------------------------------------

"global/standard stuff
    syntax enable
    set t_Co=256
    "colorscheme Tomorrow-Night-Bright
    colorscheme deus
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
    set cc=101
    set backspace=indent,start
    set tags=tags
	"parenthesis highlighting color
    highlight MatchParen cterm=bold ctermbg=white ctermfg=none
	"line number color
    highlight LineNr ctermfg=lightred
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


"language-dependent indentation
  "python
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
  "ruby
    autocmd FileType ruby set tabstop=2
    autocmd FileType ruby set softtabstop=2
    autocmd FileType ruby set shiftwidth=2
    autocmd FileType ruby set expandtab
  "csharp
    autocmd FileType csharp set tabstop=4
    autocmd FileType csharp set softtabstop=4
    autocmd FileType csharp set shiftwidth=4
  "go
    autocmd FileType go set tabstop=4
    autocmd FileType go set softtabstop=4
    autocmd FileType go set shiftwidth=4
    autocmd FileType go set noexpandtab
  "elm
    autocmd FileType elm set syntax=elm
    autocmd FileType elm set tabstop=2
    autocmd FileType elm set softtabstop=2
    autocmd FileType elm set shiftwidth=2
    autocmd FileType elm set expandtab
  "js
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set softtabstop=2
    autocmd FileType javascript set shiftwidth=2
    autocmd FileType javascript set expandtab
  "html
    autocmd FileType html set tabstop=2
    autocmd FileType html set softtabstop=2
    autocmd FileType html set shiftwidth=2
    autocmd FileType html set expandtab

"custom mappings
    "ctrl-d is like dd inside insert mode
    imap <c-d> <esc>ddi

    "ctrl-e jumps to the end of the line while in insert mode
    imap <c-e> <esc>A

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
