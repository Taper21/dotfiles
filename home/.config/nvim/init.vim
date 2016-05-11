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

" lightline  (StatusBar)
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim',{'for': ['html','xml']}
Plug 'matchit.zip'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'cohama/lexima.vim'
"Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutBackInsert = '<M-b>'
Plug 'dyng/ctrlsf.vim'
nmap g/ <Plug>CtrlSFPrompt
Plug 'mxw/vim-jsx'
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['eslint','jshint']
let g:lightline = { 'colorscheme': 'flatcolor' }

" " Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsSnippetDirectories=["UltiSnips","plugged/vim-snippets/UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:jsx_ext_required = 0
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

noremap yp "0p
noremap yP "0P

" If .vimrc.local exists in current directory, to support project-local configs
if filereadable( ".vimrc.local" )
    source .vimrc.local
endif
filetype plugin indent on
colorscheme flatcolor
set clipboard=unnamed,unnamedplus
