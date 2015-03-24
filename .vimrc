set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Ex: Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Ex: Plugin 'user/L9', {'name': 'newL9'}

"My plugins
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-scripts/Smart-Tabs'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/taglist.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'

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

" vim-clang-format
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1
let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#auto_formatexpr=1

" vim-autopep8
let g:autopep8_ignore="E203,E221,E401"

" vim-flake8
let g:flake8_ignore="E203,E221,E401"

set nowrap
" set gfn=Monospace\ 8

colorscheme slate

" Clear existing autocommands
autocmd!

" Enable syntax highlighting in terminals which can display colors:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" Allow vim to dictate title of xterm window
set title

" Do not allow this file to be overridden by others
set nomodeline

" Set indent and tab; convert tabs to spaces
set noexpandtab
set copyindent
set preserveindent
set shiftwidth=4
set softtabstop=0
set tabstop=4
"set smarttab
"set smartindent
"set autoindent
"set cindent

set ignorecase
set smartcase

" Set initial window size
" set lines=80 columns=100

" Copy indentation down lines
set shiftround
"set autoindent

" Highlight all search matches
set hlsearch

" Remove whitespace from end of line
autocmd FileType c,cpp,java,php,py,yaml,xml,html,js,protein autocmd BufWritePre <buffer> :%s/\s\+$//e

"set makeprg=ninja\ -C\ /local/devel/vcs_trunk/shared_debug
set makeprg=ninja\ -C\ ${PWD}
set autowrite
"Auto do something after write (in this case make)
"autocmd BufWritePost <buffer> make

set autochdir
set wildmode=longest,list,full
set wildmenu 

"set runtimepath+=$HOME/.vim/plugins/l9
"set runtimepath+=$HOME/.vim/plugins/fuzzyfinder
"
cnoreabbrev <expr> ninja ((getcmdtype() is# ':' && getcmdline() is# "ninja")?("make"):("ninja"))
cnoreabbrev <expr> install ((getcmdtype() is# ':' && getcmdline() is# "install")?("make install"):("install"))

set switchbuf=useopen,usetab,newtab

au BufNewFile,BufRead *.ipp set filetype=cpp
autocmd FileType c,cpp,h,hpp,slang set cindent smartindent
autocmd FileType make set noexpandtab
command -nargs=+ SReplace call StepReplace(<f-args>)
function StepReplace(...)
  if a:0 == 1
    let @y = input("Replace with: ", @y)
    let y = @y
    if @y =~ "\\d\\+$"
      let n = substitute(@y, ".\\{-}\\(\\d\\+\\)$", "\\1", "") + a:1
      let @y = substitute(@y, "\\(.\\{-}\\)\\d\\+$", "\\1".n, "")
    endif
    return y
  elseif a:0 == 3
    let @y = a:2
    execute "%s/".a:1."/\\=StepReplace(".a:3.")/".(&gdefault ? "" : "g")."c"
  else
    echo "Usage: SReplace <search> <substitute> <increment>"
  endif
endfunction
