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
"set colorcolumn=80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set textwidth=80

"easy split navigation"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"Colorscheme (Colorscheme){
Plug 'MaxSt/FlatColor'
    let g:flatcolor_termcolors=16
    set background=dark
"}

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
Plug 'sbdchd/neoformat'
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --print-width\ 100\ --single-quote\ --jsx-bracket-same-line
" Use formatprg when available
let g:neoformat_try_formatprg = 1
autocmd BufWritePre *.js Neoformat
Plug 'mbbill/undotree'
Plug 'benmills/vimux'
Plug 'terryma/vim-multiple-cursors'
Plug 'svermeulen/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep='░'
let g:airline_right_sep='░'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='flatcolor'
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim',{'for': ['html','xml']}
Plug 'matchit.zip'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'cohama/lexima.vim'
"Plug 'pangloss/vim-javascript'
Plug 'neomake/neomake'
let g:neomake_warning_sign = {
        \ 'text': '?',
        \ 'texthl': 'WarningMsg'
        \ }
let g:neomake_error_sign = {
        \ 'text': '!',
        \ 'texthl': 'ErrorMsg'
        \ }
    "let g:neomake_open_list = 1
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd BufWrite,BufEnter *.js :Neomake
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

let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif
syn match kivyPreProc /#:.*/
syn match kivyComment /#.*/
syn match kivyRule /<\I\i*\(,\s*\I\i*\)*>:/
syn match kivyAttribute /\<\I\i*\>/ nextgroup=kivyValue
syn include @pyth $VIMRUNTIME/syntax/python.vim
syn region kivyValue start=":" end=/$/ contains=@pyth skipwhite
syn region kivyAttribute matchgroup=kivyIdent start=/[\a_][\a\d_]*:/ end=/$/ contains=@pyth skipwhite
if version >= 508 || !exists("did_python_syn_inits")
	if version <= 508
		let did_python_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink kivyPreproc PreProc
	HiLink kivyComment Comment
	HiLink kivyRule Function
	HiLink kivyIdent Statement
	HiLink kivyAttribute Label
	delcommand HiLink
endif

let g:ctrlp_custom_ignore = '\v[\/](git|hg|svn|node_modules)$'

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
colorscheme flatcolor
set clipboard=unnamed,unnamedplus
let mapleader=" "
noremap <Leader><Leader> <C-^>
noremap <Leader>j :bp<CR>
noremap <Leader>k :bn<CR>
noremap <Leader>d :bd<CR>
nnoremap <Leader>tc :tabc<return>
nnoremap <Leader>tn :tabn<return>
nnoremap <Leader>tp :tabp<return>
nnoremap <Leader>te :tabe<space>
nmap <leader>vpi :PlugInstall<CR>
nmap <leader>vpu :PlugUpdate<CR>
nmap <leader>vpc :PlugClean<CR>
nmap <leader>use :UltiSnipsEdit<CR>
nmap <leader>en :e ~/.config/nvim/init.vim<CR>
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

