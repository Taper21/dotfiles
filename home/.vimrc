" scriptencoding utf-8
set encoding=utf-8
set nobackup
set noswapfile
set nocompatible              " be iMproved, required
filetype on                  " required
set number
set rnu
set hlsearch
set wildmenu
set cursorline
set backspace=indent,eol,start
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set fillchars=vert:│ "Set vertical border of splits
set splitright splitbelow

if &term == 'xterm' || &term == 'screen'
set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"set colorcolumn=80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set textwidth=80

"easy split navigation"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

com! Json :%!python3 -m json.tool

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --all' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
"
"Colorscheme (Colorscheme){
Plug 'challenger-deep-theme/vim',{'as':'challenger_deep'}

let g:challenger_deep_termcolors=16
set background=dark
"}

Plug 'digitaltoad/vim-pug'
Plug 'bkad/CamelCaseMotion'
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
Plug 'prettier/vim-prettier'
Plug 'dense-analysis/ale'
" Fix files with prettier, and then ESLint.
let g:ale_fixers = {
      \  'javascript': ['prettier', 'eslint'],
      \  'typescript': ['prettier', 'eslint'],
      \  'typescriptreact': ['prettier','eslint'],
      \  'python': ['black'],
      \ }
let g:ale_linter_aliases = {'typescriptreact': ['typescript']}
let g:ale_linters = {'javascript': ['prettier', 'eslint'],'typescript': ['prettier', 'eslint', 'tsserver'], 'typescriptreact':['prettier','eslint', 'tsserver'], 'python':['pylint']}"
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_disable_lsp = 0
let g:ale_linters_explicit = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" let g:prettier#exec_cmd_async = 1
" " when running at every change you may want to disable quickfix
" let g:prettier#quickfix_enabled = 0
" let g:prettier#autoformat = 1
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
" Plug 'sbdchd/neoformat'
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --print-width\ 100\ --single-quote\ --jsx-bracket-same-line
" " Use formatprg when available
" autocmd FileType javascript setlocal formatprg=prettier\ --write\ --stdin\ --print-width\ 100\ --single-quote\ --jsx-bracket-same-line
" autocmd BufWritePre *.js Neoformat
" let g:neoformat_try_formatprg = 1
Plug 'kkoomen/vim-doge'
let g:doge_mapping='<Leader>D'

Plug 'puremourning/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'

Plug 'mbbill/undotree'
Plug 'benmills/vimux'
Plug 'terryma/vim-multiple-cursors'
Plug 'svermeulen/vim-repeat'
Plug 'wellle/targets.vim'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
set showtabline=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='░'
let g:airline_right_sep='░'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='challenger_deep'
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plug 'https://github.com/kien/ctrlp.vim'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim',{'for': ['html','xml', 'javascript']}
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
  \ 'typescript' : {
  \     'extends' : 'jsx',
  \ },
\}
Plug 'tmhedberg/matchit'
" Plug 'matchit.zip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'janko-m/vim-test'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-CountJump'
Plug 'inkarkat/vim-ConflictMotions'
"Plug 'cohama/lexima.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'neomake/neomake'
"let g:neomake_warning_sign = {
"        \ 'text': '?',
"        \ 'texthl': 'WarningMsg'
"        \ }
"let g:neomake_error_sign = {
"        \ 'text': '!',
"        \ 'texthl': 'ErrorMsg'
"        \ }
"    "let g:neomake_open_list = 1
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_jsx_enabled_makers = ['eslint']
"autocmd BufWrite,BufEnter *.js :Neomake
Plug 'dgraham/vim-eslint'
Plug 'isRuslan/vim-es6'
Plug 'IN3D/vim-raml'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-b>'
Plug 'dyng/ctrlsf.vim'
nmap g/ <Plug>CtrlSFPrompt
Plug 'bkad/CamelCaseMotion'

" " Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
Plug 'ryanoasis/vim-devicons'
set encoding=utf8
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
" Language Servers
" Plug 'Quramy/tsuquyomi'
Plug 'jparise/vim-graphql'

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"if has("syntax")
  syntax on
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"swp nicht im ordner"
"set backup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp


set scrolljump=0
set scrolloff=5
"set smartindent
set expandtab
set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set hlsearch
set incsearch

" If .vimrc.local exists in current directory, to support project-local configs
if filereadable( ".vimrc.local" )
    source .vimrc.local
endif
filetype plugin indent on
colorscheme challenger_deep
set clipboard=unnamed,unnamedplus
let mapleader=" "
noremap <Leader><Leader> <C-^>
noremap <Leader>j :bp<CR>
noremap <Leader>k :bn<CR>
noremap <Leader>d :bd<CR>
noremap <Leader>x :BD<CR>
noremap <Leader>da :%bd\|e#\|bd#<CR>
nnoremap <Leader>tc :tabc<return>
nnoremap <Leader>tn :tabn<return>
nnoremap <Leader>tp :tabp<return>
nnoremap <Leader>te :tabe<space>
nmap <leader>vpi :PlugInstall<CR>
nmap <leader>vpu :PlugUpdate<CR>
nmap <leader>vpc :PlugClean<CR>
nmap <leader>use :UltiSnipsEdit<CR>
nmap <leader>en :e ~/.vimrc<CR>
nmap <leader>et :e ~/.tmux.conf<CR>
nmap <leader>sf :NERDTreeFind<CR>
nmap <leader>n :NERDTreeToggle<CR>
nnoremap U :UndotreeToggle<cr>
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>q! :q!<CR>
noremap <Leader>wq :wq<CR>
noremap <Leader>e :Errors<CR>
noremap <Leader>vs :vsplit<CR>
noremap <Leader>xs :split<CR>
noremap <Leader>X <C-W>o
noremap <Leader>ll :IndentLinesToggle<CR>
noremap <Leader>g :ALEGoToDefinition<CR>
noremap <Leader>a :ALEImport<CR>
noremap <Leader>f :ALEFindReferences<CR>
noremap <Leader>rn :ALERename<CR>
noremap <Leader>fn :ALEFileRename<CR>
