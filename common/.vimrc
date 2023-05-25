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
" Plugin 'rhysd/vim-clang-format' autoformat instead
"Plugin 'vim-scripts/Smart-Tabs'
"Plugin 'vim-scripts/FuzzyFinder' use command-t instead
Plugin 'vim-scripts/taglist.vim'
" Plugin 'nvie/vim-flake8' autoformat instead
" Plugin 'tell-k/vim-autopep8' autoformat instead
" Plugin 'jiangmiao/auto-pairs' don't like
" Plugin 'Townk/vim-autoclose' don't like
" Plugin 'Rip-Rip/clang_complete'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-fireplace'
Plugin 'pangloss/vim-javascript'
Plugin 'mfukar/robotframework-vim'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'mitsuhiko/vim-jinja.git' not working right
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'venantius/vim-cljfmt'
Plugin 'cemerick/piggieback'
" Plugin 'Shougo/neocomplete'
" Plugin 'jaxbot/browserlink.vim'
Plugin 'tpope/vim-surround'
"Plugin 'valloric/youcompleteme'
Plugin 'mbbill/undotree'
Plugin 'bling/vim-airline'
Plugin 'alvan/vim-closetag'
Plugin 'prettier/vim-prettier'
Plugin 'w0rp/ale'
"w0rp/ale is now...
"Plugin 'dense-analysis/ale'
Plugin 'Rykka/riv.vim'
"Plugin 'reedes/vim-lexical' very slow completions
Plugin 'mxw/vim-jsx'
Plugin 'wojtekmach/vim-rename'
Plugin 'zxqfl/tabnine-vim'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'shime/vim-livedown'

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

"" vim-clang-format
"let g:clang_format#code_style="llvm"
"let g:clang_format#detect_style_file=1
"let g:clang_format#auto_format=1
"let g:clang_format#auto_format_on_insert_leave=0
"let g:clang_format#auto_formatexpr=1
let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"

" vim-autopep8
" let g:autopep8_ignore="E203,E221,E401"

" vim-flake8
"let g:flake8_ignore="E203,E221,E401"

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

" Enable syntax highlighting in terminals which can display colors:
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

augroup kvl_format
    autocmd!
    " Remove whitespace from end of line
    autocmd FileType c,cpp,java,php,python,py,yaml,xml,html,protein,shell,rst,md,yaml :autocmd! BufWritePre <buffer> :%s/\s\+$//e
    autocmd FileType c,cpp,java,php,python,py,xml :autocmd! BufWritePre <buffer> :Autoformat
    
    " when running at every change you may want to disable quickfix
    let g:prettier#quickfix_enabled = 1

    let g:prettier#autoformat = 1

    " max line length that prettier will wrap on
    " Prettier default: 80
    let g:prettier#config#print_width = 80

    " number of spaces per indentation level
    " Prettier default: 2
    let g:prettier#config#tab_width = 2

    " use tabs over spaces
    " Prettier default: false
    let g:prettier#config#use_tabs = 'false'

    " print semicolons
    " Prettier default: true
    let g:prettier#config#semi = 'true'

    " single quotes over double quotes
    " Prettier default: false
    let g:prettier#config#single_quote = 'true'

    " print spaces between brackets
    " Prettier default: true
    let g:prettier#config#bracket_spacing = 'true'

    " put > on the last line instead of new line
    " Prettier default: false
    let g:prettier#config#jsx_bracket_same_line = 'false'

    " avoid|always
    " Prettier default: avoid
    let g:prettier#config#arrow_parens = 'avoid'

    " none|es5|all
    " Prettier default: none
    let g:prettier#config#trailing_comma = 'es5'

    " flow|babylon|typescript|css|less|scss|json|graphql|markdown
    " Prettier default: babylon
    let g:prettier#config#parser = 'babylon'

    " cli-override|file-override|prefer-file
    let g:prettier#config#config_precedence = 'prefer-file'

    " always|never|preserve
    let g:prettier#config#prose_wrap = 'preserve'
    
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup END

augroup kvl_ale_config
  let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
  let g:ale_linters = {'javascript':['eslint'],'jsx': ['stylelint', 'eslint']}
augroup END

augroup kvl_wrap_text
    autocmd!
    autocmd FileType rst,tex setlocal wrap
augroup END

augroup vimrc_hooks
    autocmd!
    autocmd BufWritePost .vimrc source ~/.vimrc
augroup END

" highlight KeywordSeparator guibg=#303030 guifg=darkgreen gui=underline
" syntax KeywordSeparator /  /

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

augroup cpp_stuff
    autocmd!
    au BufNewFile,BufRead *.ipp set filetype=cpp
    autocmd FileType c,cpp,h,hpp,slang set cindent smartindent
    autocmd FileType make set noexpandtab
augroup END

augroup lexical
  autocmd!
  autocmd FileType markdown,mkd setlocal spell
  autocmd FileType textile setlocal spell
  autocmd FileType text setlocal spell
  autocmd FileType rst setlocal spell
  autocmd FileType tex setlocal spell
  autocmd FileType python,html,js,yaml setlocal spell
augroup END

let g:neocomplete#enable_at_startup = 1
