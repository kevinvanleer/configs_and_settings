set nocompatible
filetype off

let g:CommandTPreferredImplementation='lua'

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/L9'
" Plug 'wincent/command-t'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

Plug 'kana/vim-operator-user'
Plug 'vim-scripts/taglist.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-fireplace'
Plug 'pangloss/vim-javascript'
Plug 'mfukar/robotframework-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'venantius/vim-cljfmt'
Plug 'cemerick/piggieback'
Plug 'ms-jpq/coq_nvim'
Plug 'mbbill/undotree'
Plug 'bling/vim-airline'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'Rykka/riv.vim'
Plug 'wojtekmach/vim-rename'
" Plug 'zxqfl/tabnine-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'shime/vim-livedown'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}

Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'kamykn/spelunker.vim'

Plug 'rstacruz/vim-closer'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'

"Sets pwd to git root dir
"Plug 'airblade/vim-rooter'
Plug 'dbakker/vim-projectroot'

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"

let g:coq_settings = { 'auto_start': 'shut-up' }

" FuzzyFinder
map <F2> :tabp <CR>
map <F3> :tabn <CR>
map <F4> :Autoformat <CR>
map <F5> [(
map <F6> ])
map <F7> :UndotreeToggle <CR>
map <F8> :so $MYVIMRC <CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>


set nowrap
" set gfn=Monospace\ 8

colorscheme slate
" Fix highlighting for brackets
hi MatchParen cterm=none ctermbg=green ctermfg=blue

" Enable syntax highlighting in terminals which can display colors:
" Not sure this is necessary
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" Allow vim to dictate title of xterm window
set title

" Do not allow this file to be overridden by others
set nomodeline

" Set indent and tab; convert tabs to spaces
set expandtab
"set copyindent
"set preserveindent
set shiftwidth=2
set softtabstop=0
set tabstop=8
"set smarttab
set smartindent
set autoindent
set cindent

set ignorecase
set smartcase

" Set initial window size
" set lines=80 columns=100

" Copy indentation down lines
"set shiftround
"set autoindent

" Highlight all search matches
set hlsearch incsearch

augroup kvl_ale_config
  let g:ale_fix_on_save = 1
  let g:ale_linters_explicit = 1
augroup END

augroup kvl_wrap_text
    autocmd!
    autocmd FileType rst,tex setlocal wrap
augroup END

augroup vimrc_hooks
    autocmd!
    autocmd BufWritePost .vimrc source ~/.vimrc
    autocmd BufWritePost .init.vim source ~/.config/nvim/init.vim
augroup END

" highlight KeywordSeparator guibg=#303030 guifg=darkgreen gui=underline
" syntax KeywordSeparator /  /

"set makeprg=ninja\ -C\ /local/devel/vcs_trunk/shared_debug
set makeprg=ninja\ -C\ ${PWD}
set autowrite

set autochdir
set wildmode=longest,list,full
set wildmenu

cnoreabbrev <expr> ninja ((getcmdtype() is# ':' && getcmdline() is# "ninja")?("make"):("ninja"))
cnoreabbrev <expr> install ((getcmdtype() is# ':' && getcmdline() is# "install")?("make install"):("install"))

set switchbuf=useopen,usetab,newtab

augroup fzf
  "Type '\' then ag to trigger
  :nnoremap <silent> <leader>a :ProjectRootExe Ag<cr>
  :nnoremap <silent> <leader>rg :ProjectRootExe Rg<cr>
  :nnoremap <silent> <leader>f :ProjectRootExe Files<cr>
  :nnoremap <silent> <leader>g :ProjectRootExe GFiles<cr>
  :nnoremap <silent> <leader>l :ProjectRootExe Lines<cr>
  :nnoremap <silent> <leader>b :Buffers<cr>
" Override commandt for the time being
  :nnoremap <silent> <leader>t :ProjectRootExe GFiles<cr>
augroup END

augroup projectroot
  :noremap <expr> <leader>ep ':edit '.projectroot#guess().'/'
augroup END

augroup cpp_stuff
    autocmd!
    au BufNewFile,BufRead *.ipp set filetype=cpp
    autocmd FileType c,cpp,h,hpp,slang set cindent smartindent
    autocmd FileType make set noexpandtab
augroup END

augroup lexical
"  autocmd!
"  autocmd FileType markdown,mkd setlocal spell
"  autocmd FileType textile setlocal spell
"  autocmd FileType text setlocal spell
"  autocmd FileType rst setlocal spell
"  autocmd FileType tex setlocal spell
"  autocmd FileType python,html,js,jsx,yaml setlocal spell
  let g:spelunker_check_type=2  
augroup END

let g:CommandTFileScanner = 'git'

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Hack\ Nerd\ Font:h11
