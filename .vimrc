"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"essential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set nocompatible
set termguicolors
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" put plugin here

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'nikvdp/ejs-syntax'
""Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'vim-scripts/indentpython.vim'
""Plugin 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}
Plugin 'neoclide/coc.nvim' , {'branch' : 'release'}
Bundle 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
""Plugin 'suoto/vim-hdl'
""Plugin 'vhda/verilog_systemverilog.vim'
""Plugin 'Cognoscan/vim-vhdl'
""Plugin 'xolox/vim-tlv-mode'
""Plugin 'patstockwell/vim-monokai-tasty'
""Plugin 'rdnetto/YCM-Generator'
""Plugin 'tell-k/vim-autopep8'
""Plugin 'wsdjeg/FlyGrep.vim'
"Plugin 'psf/black'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'styled-components/vim-styled-components', { 'branch': 'main'}
Plugin 'jparise/vim-graphql'

"plugin line end here
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.hbs set filetype=html
autocmd BufRead,BufNewFile *.njk set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"essential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
set number
set hlsearch
set incsearch
set noswapfile
"set foldmethod=marker
"set cursorline
"set cursorcolumn
set showmatch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""""
"visual decorations
""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set showmode
set showcmd
set modeline
set ruler
set title
set list


""""""""""""""""""""""""""""""""""""""""
"tab things
""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
set cindent
set shiftround

""""""""""""""""""""""""""""
""python setting
""""""""""""""""""""""""""""
"au BufNewFile,BufRead *.py "
"\ set tabstop=4
"\ set softtabstop=4
"\ set shiftwidth=4
"\ set textwidth=79
"\ set expandtab
"\ set autoindent
"\ set fileformat=unix
"
""auto add python header --start
"autocmd BufNewFile *.py 0r ~/.vim/vim_template/vim_python_header
"autocmd BufNewFile *.py ks|call FileName()|'s
"autocmd BufNewFile *.py ks|call CreatedTime()|'s
"
"fun FileName()
"    if line("$") > 10
"        let l = 10
"    else
"        let l = line("$")
"    endif
"    exe "1,".l"."g/File Name:.*/s/File Name:.*/File Name:".expand("%")
"endfun
"
"fun CreatedTime()
"    if line("$") > 10
"        let l = 10
"    else
"        let l = line("$")
"    endif
"    exe "1,".l."g/Created Time:.*/s/Created Time:./Created Time:".strftime("%Y-%m-%d %T")
"endfun
""auto add python header --end

""map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
""function RunPython()
""    let mp = &makeprg
""    let ef = &errorformat
""    let exeFile = expand("%:t")
""    setlocal makeprg=python\ -u
""    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %1%.%#,%Z%[%^\ ]%\\@=%m
""    silent make %
""    copen
""    let &makeprg = mp
""    let &errorformat = ef
""endfunction
nmap <F9> :!python %<cr>
""""""""""""""""""""""""""""""""""""""""
"vim navigation with file tabs
""""""""""""""""""""""""""""""""""""""""
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<TAB>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

nnoremap n nzz
nnoremap N Nzz

xnoremap p pgvy
imap <C-v> <C-r>"

""""""""""""""""""""""""""""""""""""""""
"word wrap without line breaks
""""""""""""""""""""""""""""""""""""""""
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

""""""""""""""""""""""""""""""""""""""""
"vimgrep next
""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>n :cnext <cr>
"nnoremap <leader>p :cprevious <cr>

""""""""""""""""""""""""""""""""""""""""
"delete to blackhole buffer
""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>space
"vnoremap <leader>space

"""""""""""""""""""""""""""""""""""""""""
""enable mouse for terminal
"""""""""""""""""""""""""""""""""""""""""
"if has('mouse')
"		set mouse=a
"end if
""""""""""""""""""""""""""""""""""""""""
"misc
""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set ttyfast
set diffopt+=vertical
""""""""""""""""""""""""""""""""""""""""
"autogroup
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"auto save folds
""""""""""""""""""""""""""""""""""""""""
augroup AutoSaveFolds
		autocmd!
		autocmd BufWinLeave *.* mkview
		autocmd BufWinEnter *.* silent loadview
augroup END

""""""""""""""""""""""""""""""""""""""""
"auto complete bracket
""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
""inoremap < <><ESC>i
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"more plug in config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
"nerdtree
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>o :NERDTreeTabsOpen<cr>
nnoremap <leader>f :NERDTreeTabsClose<cr>
nmap <C-n> :NERDTreeToggle<cr>

"let g:lightline={
"\ 'colorscheme': 'jellybeans',
" 'separator

map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeWinSize=30

set encoding=utf-8
set fileencoding=utf-8
map <leader>r :NERDTreeFinder<cr>


""""""""""""""""""""""""""""""""""""""""
"airline
""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled=1
let g:airline_theme='powerlineish'
set laststatus=2

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

""""""""""""""""""""""""""""""""""""""""
"ale
""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers={
                        \ '*': ['remove_trailing_lines', 'trim_whitespace'],
        		        \ 'javascript':['eslint'],
                        \ 'typescript':['prettier'],
                        \ 'css':['prettier'],
                        \ 'html':['prettier'],
                        \}

let g:ale_linters={
                        \ 'javascript': ['eslint'],
                        \ 'typescript':['tsserver', 'tslint'],
                        \ 'python': ['pylint'],
                        \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
                        \}

""nnoremap ]r :ALENextWrap<CR>
""nnoremap [r :ALEPreviousWrap<CR>

let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:ale_c_cppcheck_option='--enable=all'
let g:ale_cpp_cppcheck_options='--enable=all'
let g:ale_linters_explicit=1
let g:ale_sign_error='>>'
let g:ale_sign_warning='--'
let g:ale_fix_on_save=1

let g:ale_c_gcc_options='-Wa11 -O2 -std=c99'
let g:ale_cpp_gcc_options='-Wa11 -O2 -std=c++14'
let g:ale_c_cppcheck_options=''
let g:ale_cpp_cppcheck_options=''


""""""""""""""""""""""""""""""""""""""""
"ycm
""""""""""""""""""""""""""""""""""""""""
"let g:ycm_python_interpreter_path=''
"let g:ycm_python_sys_path=[]
"let g:ycm_extra_conf_vim_dat[
"                                \ 'g:ycm_python_interpreter_path',
"                                \ 'g:ycm_python_sys_path'
"                                \]
"
"""let g:ycm_global_ycm_extra_conf='~/global_etra_conf.py'
""let g:SimplyIFold_docstring_preview=1
""let g:ycm_server_python_interpreter='/usr/bin/python3'
""let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
""let g:ycm_autoclose_preview_window_after_completion=1
""map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""
"psf/black
""""""""""""""""""""""""""""""""""""""""
"let g:black_fst
"let g:black_linelength
"let g:black_skip_string_normalization


""""""""""""""""""""""""""""""""""""""""
"YCM-Generator
""""""""""""""""""""""""""""""""""""""""
""noremap <C-I> :YcmGenerateConfig -c g++ -v -x c++ -f -b make .<CR>
""let g:ycm_show_diagnostics_ui=0
""let g:ycm_min_num_of_chars_for_completion = 4
""let g:ycm_min_num_identifier_canddate_chars = 4
""let g:ycm_enable_diagnastic_highlighting =0
""
""set completeopt-=preview
""let g:ycm_add_preview_to_completeopt = 0


""""""""""""""""""""""""""""""""""""""""
"python-pep8
""""""""""""""""""""""""""""""""""""""""
let g:autopep8_disable_show_diff=1


""""""""""""""""""""""""""""""""""""""""
"gruvbox
""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

""colorscheme desert

"colorscheme verilog_systemverilog

""colorscheme darkblue
""let &termencoding=&encoding
""set fileencodings=utf-8,gbk,ucs-bom,cp936

""javascript / typescript
autocmd BufEnter *.{js.jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js.jsx,ts,tsx} :syntax sync clear

""""""""""""""""""""""""""""""""""""""""
"coc
""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:coc_disable_startup_warning = 1

""""""""""""""""""""""""""""""""""""""""
"hdl
""""""""""""""""""""""""""""""""""""""""
""au BufNewFile,BufRead *.sv,*svh,*.vh,*.v so ~/.vim/bundle/systemverilog.vim/syntax/systemverilog.vim
