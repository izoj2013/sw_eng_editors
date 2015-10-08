""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
" 	Julien Shabani
"
" Version:
"	1.0 - 03/09/2015 15:35:15
"
" Sections:
"	-> Plugins
"	-> General
"	-> VIM user interface
"	-> Colours and Fonts
"	-> Text, tab and indent related stuff
" 	-> Moving around, tabs and buffers
" 	-> Status line
" 	-> Editing mappings
" 	-> vimgrep searching and scope displaying
" 	-> Spell checking
" 	-> Miscelleanous
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " be iMproved, it's required
filetype off                " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself - required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin()/end()
Plugin 'tpope/vim-fugitive'         " A git wrapper; they claim it's awesome
Plugin 'L9'                         " Vim-script lib - utility fns and cmds
" Plugin 'user/L9', {'name': 'newL9'} " Avoid name conflict with L9
Plugin 'Valloric/YouCompleteMe'     " Code completiion engine 4 vim
Plugin 'scrooloose/syntastic'        " Syntax checking 'hacks' 4 vim
Plugin 'bling/vim-airline'          " Lean n mean status/tabline 4 vim
Plugin 'SirVer/ultisnips'           " Ultimate snippet solution 4 vim
Plugin 'edsono/vim-matchit'         " A git repo 4 vim plugin called matchit
Plugin 'elzr/vim-json'              " A better JSON 4 vim
Plugin 'honza/vim-snippets'         " Repo containing snippets files 4 ++ programming lang
" Plugin 'justinmk/vim-sneak'         " The missing motion 4 vim
Plugin 'kien/ctrlp.vim'             " Complex parameters finder 4 vim
Plugin 'majutsushi/tagbar'          " Vim plugin 2 display tags in a window, ordered by scope
Plugin 'scrooloose/nerdcommenter'   " Plugin 4 intense comments
Plugin 'scrooloose/nerdtree'        " Plugin file-tree exploration
Plugin 'sjl/gundo.vim'              " Plugin to visualize your vim vim undo tree
Plugin 'Lokaltog/vim-powerline'     " Plugin 4 powerline fonts
Plugin 'tpope/vim-sleuth'           " Automatically adjusts 'shiftwidth' and expandtab
Plugin 'tpope/vim-surround'         " Completion n pairing of parentheses, brackets n quotes
Plugin 'tyru/open-browser.vim'      " Open URI with your favorite browser

" Colour schemes
Plugin 'tomasr/molokai'             " Molokai colour scheme 4 vim
Plugin 'flazz/vim-colorschemes'     " One colourscheme pacl 2 rule tem all.-

" Elixir vim-plug
Plugin 'elixir-lang/vim-elixir'

" HTML5 plugins
Plugin 'pangloss/vim-javascript'    " Provides syntax and indent
Plugin 'mattn/emmet-vim'            " Html and css editing


" Quite recent plugin 4 android dev - features 2 be verified
Plugin 'hsanson/vim-android'

" Never complete and want 2 come back later
" TaskList plugin 4 vim is here 2 help
Plugin 'TaskList.vim'
Plugin 'mileszs/ack.vim'                    " Emulating perl in vim
Plugin 'alfredodeza/pytest.vim'             " running unit tests w/in vim

" Indentation 4 python
Plugin 'hynek/vim-python-pep8-indent'

" Specific code completion 4 python
Plugin 'ervandew/supertab'

call vundle#end()
filetype plugin indent on           " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore compiled files
set wildignore=*.o,*.~,*.pyc

" Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace to act as expected
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching, try to be smart about cases
set smartcase

" Make search act like in modern browsers
set incsearch

" Don't redraw while executing macros 
" (good performnce config)
set lazyredraw

" For regex, turn magic on
set magic

" Set line number
set number

" Esc Key is to far.- => 11.09.2015
imap ;; <Esc>


" No annoying sound on errors
set noerrorbells
set novisualbell
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Colours and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting 
syntax enable

set t_Co=256
set background=dark
colorscheme vividchalk 

" Set utf8 as std encoding 
set encoding=utf8

" Use nix as std file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Text, tab and indent related stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using ;)
set smarttab

" Set space amount for one tab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai 		            " Auto indent
set si		            " Smart indent
set wrap	            " Wrap lines

set foldenable          " Folding on [type 'zi' or 'za'] 4 disable/toggle
set foldmethod=indent   " Fold on indent
set foldlevel=99        " Don't fold anything

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><CR> :noh<CR>


" Close the current buffer
map <leader>bd :Bclose<CR>

" Close all the buffers
"" map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove<CR>

" Open a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit<c-r>=expand(%:p:h")<CR>/

" Switch CWD to the directory of theb open buffer
map <leader>cd :cd %p:h<CR>:pwd<CR>

" Specify the behaviour when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Remember info about the status on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> scrooloose/nerdtree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Write n File settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Confirm if unsaved data in case :q!
set confirm
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap < <><Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>

" Enable file type detection
filetype on
filetype plugin on          " load the plugins for specific
source ~/.vim/bundle/vim-matchit/plugin/matchit.vim    " 4 vim-matchit
setlocal foldmethod=syntax                              " 4 vim-json
let g:sneak#streak = 1                                  " 4 vim-sneak
nmap <F8> :TagbarToggle<CR>                             " 4 majut--/tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> Coding n programming languages configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let javascript_enable_domhtmlcss = 0
let b:javascript_fold = 1
let g:android_sdk_path = $ANDROID_STUDIO

" HTML5 editing
let g:user_emmet_mode = 'a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Autocomplete 4 some file types
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> python 'IDE' settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" V-Split : Ctrl+w + v
" H-Split : Ctrl+w + s
" Close current windoz: Ctrl+w + q
" Smart way to move between windows
let python_highlight_all = 1
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncompete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
"source ~/.vim/plugin/ropevim.vim
" %{fugitive#statusline()}

 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-h> <c-w>h
 map <c-l> <c-w>l
 map <leader>g :GundoToggle<CR>
 map <leader>td <Plug>TaskList
 map <leader>j :RopeGotoDefinition<CR>
 map <leader>r :RopeRename<CR>
 map <leader>a <Esc>:Acko!
 map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

 " Execute the tests
 nmap <silent><Leader>tf <Esc>:Pytest file<CR>
 nmap <silent><Leader>tc <Esc>:Pytest class<CR>
 nmap <silent><Leader>tm <Esc>:Pytest method<CR>
 " Cycle through test errors
 nmap <silent><Leader>tn <Esc>:Pytest next<CR>
 nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
 nmap <silent><Leader>te <Esc>:Pytest error<CR>
 
 " Add the virtuslenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
     project_base_dir = os.environ['VIRTUAL_ENV']
     sys.path.insert(0, project_base_dir)
     activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
     execfile(activate_this, dict(__file__=activate_this))
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> YMC settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1
      \}
let g:ycm_allow_changing_updatetime = 0         " No change 2 updatetime

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> ctrlp.vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_custom_ignore = {
   \ 'dir': '\v[\/]\.(git|hg|svn)$',
   \ 'file': '\v\.(exe|so|dll)$',
   \ }
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40

" Use a version control listing command when inside a repo
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = '2tjr'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> bling-airline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#theme#molokai#palette = {}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = '<'
let g:airline#extensions#tabline#right_alt_sep = '|'

" Enable displaying tab number in tab mode
let g:airline#extensions#tabline#show_tab_nr = 1

" Configure how numbers are dispayed in the tab mode
let g:airline#extensions#tabline#tab_nr_type = 0    " # of splits (default)
let g:airline#extensions#tabline#tab_nr_type = 1    " # tab number
let g:airline#extensions#tabline#tab_nr_type = 2    " # splits n tab number

" Define the name of a formatter 4 how bufffer names are displayed
let g:airline#extensions#tabline#formatter = 'default'

" Enable displaying index of the buffet
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> molokai settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 1
let g:rehash256 = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> scrooloose/syntastic settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1   " Clear loc list if no errors
let g:syntastic_auto_loc_list = 1              " Auto loc list if buffer-err
let g:syntastic_check_on_open = 1              " Check at open
let g:syntastic_check_on_wq = 0                " No check b4 wq command
let g:systastic_python_python_exec = '/usr/bin/python3' 
let g:syntastic_html_validator_api = 'http://localhost:8877/' " HTML5 check
let g:syntastic_python_checkers = ['flake8', 'pyflakes', 'pylint']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> sjl/gundo.vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundiToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> SirVer/ultisnips settings [works w/ ymc and 'honza/vim-snippets'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<=>"
let g:UltiSnipsJumpForwardTrigger = "<c-f>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
ActivateAddons vim-snippets snipmate

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >>> 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

