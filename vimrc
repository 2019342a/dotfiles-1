set encoding=utf-8
autocmd! bufwritepost .vimrc source %
let mapleader=","

" -------------------------------------------------- 
" Plugings
" -------------------------------------------------- 
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" -------------------------------------------------- 
" Plugin config
" -------------------------------------------------- 

" Ack
" Open a new tab and search
nnoremap <Leader>a :tab split<CR>:Ack ""<Left>
nnoremap <Leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" CoffeeScript / coffee-script
nnoremap <Leader>cc :CoffeeCompile vertical<CR>
nnoremap <Leader>cl :CoffeeLint<CR>
nnoremap <Leader>cr :CoffeeRun<CR>

" Command-T
" let g:CommandTMaxHeight=15  " Limit results
" let g:CommandTMatchWindowAtTop=1  " See the matches on the top

" Gundo - useful undo-tree
nnoremap <Leader>gu :GundoToggle<CR>

" Indent Guides
nnoremap <Leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_color_change_percent = 5
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" Jedi
" Realy only using defaults, but want to keep track of anyway
let g:jedi#goto_command = "<Leader>g"
let g:jedi#get_definition_command = "<Leader>d"
let g:jedi#pydoc = "K"
let g:jedi#rename_command = "<Leader>rnc"
let g:jedi#related_names_command = "<Leader>rnn"
let g:jedi#autocompletion_command = "<C-Space>"

" LESS and CSS
nnoremap <Leader>lc :w <BAR> !lessc % > %:t:r.css<CR><space>  " Compile LESS to CSS
" Highlight and match vendor specific prefixes
nnoremap <Leader>vp :highlight VendorPrefix guifg=#00ffff gui=bold<CR>:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/<CR>

" MRU
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>  " show current file in tree
let NERDTreeIgnore = ['\.pyc$']

" Python-mode
" Turn off rope and use Jedi instead
let g:pymode_rope = 0
" Enable linting and auto write check
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_onfly = 0
let g:pymode_lint_write = 1
let g:pymode_lint_ignore = "E501"
" Enable folding
let g:pymode_folding = 1

" SuperTab - <TAB> completion
let g:SuperTabDefaultCompletionType="context"
" let g:SuperTabMappingForward='<C-space>'
" let g:SuperTabMappingBackward='<s-C-space>'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=10
" Enable active linting and disable lint for some types(:SyntasticCheck)
" python - python-mode linter
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }

" Tagbar
let g:tagbar_userarrows=1
nnoremap <Leader>r :TagbarToggle<CR>

" TaskList
map <Leader>td :TaskList<CR>

" Ingnore for search - CommandT & CtrlP
:set wildignore+=*.class,**/target/**,**/*env.CATALINA_HOME*/**,*.pyc,.git,**/gen/**


" -------------------------------------------------- 
" General options
" -------------------------------------------------- 

set clipboard=unnamedplus " set system clipboard to "+ - see :reg

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set splitright  " Open splits to the right

" Status Line
"set statusline=%t       "tail of the filename
set statusline=%f       "filename
set statusline+=%m      "modified flag
set statusline+=%h      "help file flag
set statusline+=%=      "left/right separator
set statusline+=%y      "filetype
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]\ \  "file format
set statusline+=%c,%l     "cursor column, cursor line
set statusline+=\ %L   "/total lines
set statusline+=\ %P    "percent through file


" -------------------------------------------------- 
" Navigation
" -------------------------------------------------- 
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Window switching 
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Tab switching
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Better move to end and beginning of line
nnoremap H ^
nnoremap L $
nnoremap <C-e> $
inoremap <C-e> <Esc>A

:set suffixesadd+=.py,.js " files to recognise when jumping with gf

" Copy/Yank the rest of line
nnoremap Y y$

" -------------------------------------------------- 
" Leader remaps
" -------------------------------------------------- 
inoremap jj <Esc>  

noremap <Leader>w :update<CR> " Quick save
noremap <Leader>q :quit<CR> " Quick quit
noremap <Leader>x :wq<CR> " Quick save & quit
noremap <Leader>e :e<CR> " Quick reload

noremap <Leader>l :set list!<CR> " Toggle show/hide listchars

nmap <silent> <Leader>s :set spell!<CR>
set spelllang=en_gb  " I like British English...

" Make it easy to save session in ~/.locale/share/vim/sessions
nnoremap <Leader>mks :mks! ~/.local/share/vim/sessions/

" This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>

" -------------------------------------------------- 
" Trix
" -------------------------------------------------- 
" show all TODO/FIXME/XXX in quickfix window
" noremap <Leader>do :noautocmd vimgrep /TODO/j **/*.*<CR>:cw<CR>
noremap <Leader>do :noautocmd vimgrep /\(TODO\)\|\(FIXME\)\|\(XXX\)/j **/*.*<CR>:cw<CR>

" Find occurences, but stay put... to highlight all...
noremap <Leader>* *N

" Save file with root permissions (inspired by `$ sudo !!`)
cmap w!! w !sudo tee >/dev/null %


" -------------------------------------------------- 
" Searching
" -------------------------------------------------- 
" Enable smartcase (needs ignorecase) - lower finds all / upper finds exact
" Enable incremental search to see matches as we type
set ignorecase
set smartcase
set incsearch


" -------------------------------------------------- 
" Appearance
" -------------------------------------------------- 
set number
set cursorline " highlight current line
set colorcolumn=80
set hlsearch " highlight search


" -------------------------------------------------- 
" Appearance - Powerline
" -------------------------------------------------- 
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2


" -------------------------------------------------- 
" Colorscheme
" -------------------------------------------------- 
" if $TERM == "xterm-256color"
"   set t_Co=256
" endif
set t_Co=256

" colorscheme Tomorrow-Night

" Solarized in gnome terminal
" (http://www.webupd8.org/2011/04/solarized-must-have-color-paletter-for.html)
" set background=dark
" set background=light
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_contrast="high"
" let g:solarized_visibility="high"
" colorscheme solarized

" colorscheme lucius
" LuciusLightHighContrast

" colorscheme github
" colorscheme vividchalk
colorscheme candycode
