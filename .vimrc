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
set lines=80 columns=100

" Copy indentation down lines
set shiftround
"set autoindent

" Do not wrap text
set nowrap

" Detect filetypes
filetype plugin indent on

" Highlight all search matches
set hlsearch

" Remove whitespace from end of line
autocmd FileType c,cpp,java,php,py,yaml,protein autocmd BufWritePre <buffer> :%s/\s\+$//e

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
