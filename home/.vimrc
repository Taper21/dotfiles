set nocompatible              " be iMproved, required
filetype on                  " required
set number
set rnu
set hlsearch
set t_Co=256
colorscheme molokai

"easy split navigation"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"Colorscheme (Colorscheme){
Plug 'MaxSt/FlatColor'
    let g:flatcolor_termcolors=16
    set background=dark
"}

Plug 'https://github.com/kien/ctrlp.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" " Trigger configuration. Do not use <tab> if you use
"Plugin 'Valloric/YouCompleteMe'
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
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
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0



Bundle "Valloric/YouCompleteMe"

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


    
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
