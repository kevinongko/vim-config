"-----Plugins-----"
call plug#begin("~/.vim/plugged")

" feature
"Plug 'SirVer/ultisnips'
"Plug 'Valloric/YouCompleteMe'
"Plug 'Yggdroot/indentLine'
"Plug 'alvan/vim-closetag'
"Plug 'gregsexton/MatchTag'
"Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'eugen0329/vim-esearch'
Plug 'itchyny/lightline.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'zivyangll/git-blame.vim'

" theme
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
Plug 'romainl/flattened'
Plug 'tomasr/molokai'
Plug 'kaicataldo/material.vim'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

" syntax
Plug 'StanAngeloff/php.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jwalton512/vim-blade'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

call plug#end()

"-----Configs-----"

" theme
set termguicolors
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
set background=dark
"let g:material_theme_style = 'darker'
"let g:two_firewatch_italics=1
"let g:molokai_original = 1

" nerdtree
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.swp$', '.gitkeep', '.gitattributes', '.idea', '.vscode'] "hide certain file types
let NERDTreeCascadeSingleChildDir=0 "disable auto collapse single children folder

" lightline
" let g:lightline = { 'colorscheme': 'gruvbox' }
" let g:lightline = { 'colorscheme': 'material_vim' }
let g:lightline = {'colorscheme' : 'gruvbox_material'}
" let g:lightline = { 'colorscheme': 'PaperColor' }

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue"

" vim-esearch
let g:esearch = {
  \ 'adapter':          'rg',
  \ 'backend':          'vim8',
  \ 'out':              'win',
  \ 'batch_size':       1000,
  \ 'use':              ['visual', 'hlsearch', 'last'],
  \ 'default_mappings': 1,
  \}

" vim-surround
let g:surround_no_mappings = 1

" ultisnips
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ycm
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" supertab
let g:SuperTabDefaultCompletionType = '<C-n>'

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" ale
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_fixers = {'javascript': ['eslint'], 'vue': ['eslint']}
let g:ale_linters = {'javascript': ['eslint'], 'vue': ['eslint', 'vls']}
let g:ale_fix_on_save = 1

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
set laststatus=2
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
set ttyfast
set lazyredraw
set splitbelow
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
tnoremap <Esc> <C-\><C-n>
map f <Plug>Sneak_s
map F <Plug>Sneak_S
nmap sc <Plug>Csurround
nmap sd <Plug>Dsurround
nmap sy <Plug>Ysurround
xmap sv <Plug>VSurround
nnoremap <Leader>0 :<C-u>call gitblame#echo()<CR>

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

" Spacing file types
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype sass setlocal ts=4 sts=4 sw=4
autocmd Filetype scss setlocal ts=4 sts=4 sw=4
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
