"-----Plugins-----"
call plug#begin('~/.vim/plugged')

" feature
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'eugen0329/vim-esearch'
Plug 'gregsexton/MatchTag'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kassio/neoterm'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

" theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
Plug 'romainl/flattened'
Plug 'tomasr/molokai'

" syntax
Plug 'StanAngeloff/php.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'

call plug#end()

"-----Configs-----"

" theme
set termguicolors
colorscheme gruvbox
set background=dark
"let g:two_firewatch_italics=1
"let g:molokai_original = 1

" stylus hightlight flex
hi link stylusProperty cssVisualProp

" vim-airline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 0 "buffer indicator
let g:airline_powerline_fonts = 1 "powerline font for airline
let g:airline_theme = 'gruvbox'

" nerdtree
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.swp$', '.gitkeep', '.gitattributes', '.idea', '.vscode'] "hide certain file types
let NERDTreeCascadeSingleChildDir=0 "disable auto collapse single children folder

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue"
"
" neoterm
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'rightbelow'

" vim-esearch
let g:esearch = {
  \ 'adapter':          'rg',
  \ 'backend':          'vim8',
  \ 'out':              'win',
  \ 'batch_size':       1000,
  \ 'use':              ['visual', 'hlsearch', 'last'],
  \ 'default_mappings': 1,
  \}

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ycm
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" vim
let mapleader = ' '
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
set copyindent
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set mouse=a
set nowrap
set number
set ruler
set shiftwidth=4
set showcmd
set showmode
set smartcase
set smarttab
set softtabstop=4
set t_Co=256
set tabstop=4
syntax on
filetype plugin indent on
"highlight Comment cterm=italic
"highlight htmlArg cterm=italic

"-----Key-Mapping-----"
set pastetoggle=<F3>
map <F1> :FZF <CR>
map <F2> <C-W>w
map <F4> :FixWhitespace <CR>
map <F5> :NERDTreeTabsToggle <CR>
nmap <leader><space> :nohlsearch <CR>
map <C-P> :FZF <CR>

" Tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"-----Auto-Commands-----"

" Source vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.vimrc source %
augroup END

" Sync syntax
autocmd! BufEnter * :syntax sync fromstart

" Delete white space on save
autocmd! BufWritePre * FixWhitespace

" Set stylus omnifunction
autocmd FileType stylus setlocal omnifunc=csscomplete#CompleteCSS

" Spacing file types
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype sass setlocal ts=4 sts=4 sw=4
autocmd Filetype scss setlocal ts=4 sts=4 sw=4
autocmd Filetype stylus setlocal ts=4 sts=4 sw=4
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
