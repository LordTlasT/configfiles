set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'https://tpope.io/vim/surround.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
" Turn tab to spaces
set tabstop=2 shiftwidth=2 expandtab
" Turn backspaces into spaces
set backspace=2 backspace=indent,eol,start
" Set (absolute) line numbers
set number
" Incremental search
set incsearch
" Show partial command in status line
set showcmd

" Keep a lot more command history
set history=200

if has("syntax")
  syntax on
endif

" Colorscheme Solarized dark theme
colo solarized
set background=dark

" Writes with sudo privileges
command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' > /dev/null'
" Force quit faster
command Q execute 'quit!'

" Put a line into an echo statement
command EchoLine execute 'substitute/\(^.*\)$/echo "&"/'
command E execute 'EchoLine'
command UnEchoLine execute 'substitute/echo "\(.*\)"/\1/'

" Closing brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>0
" inoremap {;<CR> {<CR>}<ESC>0

" Use system clipboard
set clipboard=unnamedplus

" Enable mouse support, basically now copying lines without line numbers
set mouse=a

" Return to last edit position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Autosave
augroup autosave
    autocmd!
    autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
augroup END
