" Setup plugins
call plug#begin('~/.vim/plugged')

Plug 'yggdroot/indentline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joshdick/onedark.vim'

call plug#end()

" indentline config
let g:indentLine_char = '│'

" vim-better-whitespace config
autocmd BufEnter * EnableStripWhitespaceOnSave  " Cleanup whitespace for all files (except blacklist)

" One dark config
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Set 24
if (has("termguicolors"))
 set termguicolors
endif

let g:onedark_terminal_italics=1
syntax on
colorscheme onedark

" Move temp files out of current directory
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//


" Setup editor defaults
set number                                                 " show line numbers
set backspace=indent,eol,start                             " backspace works like other editors in insert mode
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<    " whitespace characters when toggle on with set list

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

" Trim blank lines
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

autocmd BufWritePre * call TrimEndLines()
