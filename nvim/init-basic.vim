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

"" Visual Settings
syntax on
set ruler
set nowrap
set nu

set t_Co=256
set t_ut=

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" let hr = (strftime('%H'))
" if hr >= 18
"     set background=dark
"     colorscheme goodwolf
" elseif hr >= 8
"     set background=light
"     colorscheme direwolf
"     hi Normal     ctermbg=NONE guibg=NONE
"     hi LineNr     ctermbg=NONE guibg=NONE
"     hi SignColumn ctermbg=NONE guibg=NONE
" elseif hr >= 0
"     set background=dark
"     colorscheme goodwolf
" endif

colorscheme direwolf
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

let no_buffers_menu=1

set mousemodel=popup
set guioptions=egmrti

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

"" Abbreviations
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
"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Select All
noremap <C-a> <esc>ggVG<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Show buffers
nnoremap <silent> <leader>b :Buffers<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

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

"" enter jj for Escape Insert Mode
imap jj <Esc>

"" Surround selected word
xnoremap " <ESC>`>a"<ESC>`<i"<ESC>
xnoremap ' <ESC>`>a'<ESC>`<i'<ESC>
xnoremap ( <ESC>`>a)<ESC>`<i(<ESC>
xnoremap [ <ESC>`>a]<ESC>`<i[<ESC>
xnoremap <Leader>" <ESC>`>a"<ESC>`<i"<ESC>
xnoremap <Leader>' <ESC>`>a'<ESC>`<i'<ESC>
xnoremap <Leader>( <ESC>`>a)<ESC>`<i(<ESC>
xnoremap <Leader>[ <ESC>`>a]<ESC>`<i[<ESC>

"" Move to beginning/end of line
noremap H ^
noremap L $

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :buffers<CR>
