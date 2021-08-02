let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "html,javascript,python,rust,scala"
let g:vim_bootstrap_editor = "nvim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary' "visual select and comment stuff out
Plug 'tpope/vim-fugitive' "best Git wrapper of all time
Plug 'tpope/vim-surround' "easily surround strings
Plug 'airblade/vim-gitgutter' "show git diff on the numbers column
Plug 'vim-scripts/grep.vim' "<leader> + f for use and grep whatever.
Plug 'vim-scripts/CSApprox' "provide better colorscheme color support
Plug 'bronson/vim-trailing-whitespace' "FixWhiteSpace for trailing whitespace!
Plug 'Raimondi/delimitMate' "provide automatic closing of quotes, parenthesis, brackets, etc...
Plug 'scrooloose/syntastic' "syntax checking
Plug 'avelino/vim-bootstrap-updater' "just for update vim-boostrap

Plug 'sheerun/vim-polyglot' "collection of language packs

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim' "async command-line finder
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make} "idk

"" Vim-Session
Plug 'xolox/vim-misc' "pack of miscellaneous common plugin scripts
Plug 'xolox/vim-session' "save and restore your vim-sessions, if you want

if v:version >= 703
  Plug 'Shougo/vimshell.vim' "provide shell snippets help-commands tab when using vimshell
endif

if v:version >= 704
  "" Snippets
  Plug 'SirVer/ultisnips' "provide snippets solution. better with *.py files
endif

"***************************************************************************rr
"" Custom bundles
"*****************************************************************************
" EditorConfig
Plug 'editorconfig/editorconfig-vim' " .editorconfig rules

"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'nikolasvargas/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim'

"" Json Bundle
Plug 'elzr/vim-json'

" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Rust
" Vim racer
Plug 'racer-rust/vim-racer'

" Rust.vim
" Plug 'rust-lang/rust.vim'
"*****************************************************************************
"*****************************************************************************
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" enable mouse scroll inside vim
set mouse=a

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set smartcase
set ignorecase
set path+=**

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set nowrap
" set nu
" set cursorline

set t_Co=256
set t_ut=

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRE_COLOR=1
endif

colorscheme monokai

set termguicolors

" hi ColorColumn cterm=none gui=none guibg=none ctermfg=none
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE

let no_buffers_menu=1

set mousemodel=popup
set guioptions=egmrti

"" Disable the blinking cursor.
" set guicursor="a:blinkon0"
" set guicursor=n-v-c:block-nCursor
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
highlight Cursor guifg=None guibg=lightgray
" set guicursor=n-v-c:block-Cursor
set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
" highlight Cursor gui=NONE guifg=bg guibg=fg

set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titlestring=%f

" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set statusline=%f%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" vim-airline
" let g:airline_theme = 'kolor'

" line number, column number
" let g:airline_section_z = "line %l%#__restore__#%#__accent_bold#/%L %{g:airline_symbols.maxlinenr}%#__restore__#col %1v"

" Do not draw separators for empty sections
" let g:airline_skip_empty_sections = 1

" vim-airline-extensions
" let g:airline#extensions#syntastic#enabled = 1
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#whitespace#enabled = 1
" let g:airline#extensions#virtualenv#enabled = 1

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" unicode symbols (and some resets also)
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_symbols.maxlinenr = ''
" let g:airline_symbols.branch = ''

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

iabbrev ifmain if __name__ == '__main__':
iabbrev ifmian if __name__ == '__main__':

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-iR'
let Grep_Skip_Files = '*.log *.db *.pyc'
let Grep_Skip_Dirs = '.git node_modules venv env .tox __pycache__'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :terminal<CR>
  tnoremap <Esc> <C-\><C-n>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    " set wrap
    set wm=2
    set textwidth=119
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" enter jj for Escape Insert Mode
imap jj <Esc>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Select All
noremap <C-a> <esc>ggVG<CR>

"" Move to beginning/end of line
noremap H ^
noremap L $

"" Surround selected word
"" Use vim-surround plug command ds<char> for remove surround
xnoremap " <ESC>`>a"<ESC>`<i"<ESC>
xnoremap ' <ESC>`>a'<ESC>`<i'<ESC>
xnoremap ( <ESC>`>a)<ESC>`<i(<ESC>
xnoremap [ <ESC>`>a]<ESC>`<i[<ESC>
xnoremap <Leader>" <ESC>`>a"<ESC>`<i"<ESC>
xnoremap <Leader>' <ESC>`>a'<ESC>`<i'<ESC>
xnoremap <Leader>( <ESC>`>a)<ESC>`<i(<ESC>
xnoremap <Leader>[ <ESC>`>a]<ESC>`<i[<ESC>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,venv,__pycache__

let FZF_DIR_EXCLUDE = "-prune -o -path 'venv/**' -prune -o -path '**/__pycache__/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o"
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' " . FZF_DIR_EXCLUDE . " -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g -l""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" preview window
let g:fzf_preview_window = ['up:60%', 'ctrl-/']

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
" nnoremap <silent> <leader>e :Files<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

noremap <leader>m :SyntasticToggleMode<CR>

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
" if has('unnamedplus')
"   set clipboard=unnamed,unnamedplus
" endif
set clipboard+=unnamedplus

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
" noremap <leader>c :bd<CR>
noremap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

"" :w!! to save as sudo
ca w!! w !sudo tee >/dev/null "%"

"" GitGutterToggle
noremap <Leader>ç :GitGutterToggle<CR>
"*****************************************************************************
"" Custom configs
"*****************************************************************************
"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" Emmet config
let g:user_emmet_leader_key=','

"" ignore all of tidy's warnings
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }

" javascript
let g:javascript_enable_domhtmlcss = 1
" javascript jsx
let g:jsx_ext_required = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=4
augroup END

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" rust
" Vim racer
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

let g:racer_cmd = "/home/nikolas/.cargo/bin/cargo"

" Scala
autocmd Filetype scala setlocal ts=4 sw=4 expandtab

" jedi-vim
let g:python_host_prog = "/usr/local/bin/python2.7"
" let g:python3_host_prog = "/usr/bin/python3.8"
let g:python3_host_prog = "/usr/local/bin/python3.9"
let g:jedi#popup_on_dot = 1
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = 0
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
" let g:jedi#use_splits_not_buffers = "right"
" let g:jedi#use_tabs_not_buffers = 1

"" Remove preview docstring window on top
""" https://github.com/davidhalter/jedi-vim/blob/master/doc/jedi-vim.txti
""" 6.2. `g:jedi#auto_vim_configuration` && 6.5. `g:jedi#auto_close_doc`
set completeopt-=preview

" syntastic
let g:syntastic_python_checkers=['flake8']

" GitGutter
" Start disabled
let g:gitgutter_enabled = 1
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"" Windows clipboard workaround
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        " WSL 1
        " autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        " WSL 2
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
    augroup END
endif
