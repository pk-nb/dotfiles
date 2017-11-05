set nocompatible

" Setup plugins
call plug#begin('~/.vim/plugged')

Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

call plug#end()

" indentline config
let g:indentLine_char = '│'

" json config
" au! BufRead,BufNewFile *.json set filetype=json

" vim-better-whitespace config
autocmd BufEnter * EnableStripWhitespaceOnSave  " Cleanup whitespace for all files (except blacklist)

" Javascript / JSX file config
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Always show ale gutter
let g:ale_sign_column_always = 1
" Nerd Tree config

" Open if no files specified or directory opend
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Quit if only tree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" One dark config
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:onedark_terminal_italics=1
set background=dark
syntax on
colorscheme onedark

" Move temp files out of current directory
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//


" Setup editor defaults
set number                                                 " show line numbers
set nowrap
set sidescroll=1
set history=1000                                           " Default is 20
set undolevels=1000                                        " More levels of undo
set undofile                                               " Write a undo file
set backspace=indent,eol,start                             " backspace works like other editors in insert mode
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<    " whitespace characters when toggle on with set list
set nocursorline
set noshowmatch
hi NonText cterm=NONE ctermfg=NONE



" Terminal / OSX integration
set mouse=a                                                " Use iterm scroll events to navigate vim
set clipboard=unnamed                                      " share osx pasteboard

" Indentation
filetype indent on " Use filetype detection and file-based automatic indenting.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab " Use actual tab chars in Makefiles.

set tabstop=2
set shiftwidth=2    " Indents will have a width of 4.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set shiftround      " Round when indending with < / >
set smarttab
set autoindent
set copyindent

" Trim blank lines
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * call TrimEndLines()


" Shortcuts
nmap <silent> <c-n> :NERDTreeToggle<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
