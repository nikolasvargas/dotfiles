let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let g:polyglot_disabled = ['vue']

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
"********************************
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"********************************
Plug 'simrat39/rust-tools.nvim'
"********************************
Plug 'tpope/vim-commentary' "visual select and comment stuff out
Plug 'tpope/vim-fugitive' "best Git wrapper of all time
Plug 'tpope/vim-surround' "easily surround strings
Plug 'airblade/vim-gitgutter' "show git diff on the numbers column
Plug 'vim-scripts/grep.vim' "<leader> + f for use and grep whatever.
Plug 'vim-scripts/CSApprox' "provide better colorscheme color support
Plug 'bronson/vim-trailing-whitespace' "FixWhiteSpace for trailing whitespace!
Plug 'Raimondi/delimitMate' "provide automatic closing of quotes, parenthesis, brackets, etc...
Plug 'scrooloose/syntastic' "syntax checking
Plug 'nikolasvargas/vim-polyglot' "collection of language packs
Plug 'nikolasvargas/forest' "my colorscheme
"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" EditorConfig
Plug 'editorconfig/editorconfig-vim' " .editorconfig rules

" python
"" Python Bundle
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

call plug#end()

" Required:
filetype plugin indent on
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set autoread

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
"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set nowrap
" set nu

set t_Co=256
set t_ut=

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRE_COLOR=1
endif

set background=dark

colorscheme forest2
set termguicolors

let no_buffers_menu=1

set mousemodel=popup
set guioptions=egmrti

"" Disable the blinking cursor.
set guicursor=
" set guicursor=a:blinkoff0
set guicursor=n-v-c:block-blinkwait300-blinkon200-blinkoff150
set guicursor+=i-ci:blinkoff0

set scrolloff=3

"" Status bar
" set winbar=%=%m\ %f
set laststatus=3
highlight WinSeparator guibg=None

"" Use modeline overrides
set modeline
set modelines=10

" set title
" set titlestring=%f

" full_path|modified_flag|readonly_flag|help_flag|preview_window_flag = XXX
" set statusline=%t%m%r%h%w%=LINE\ %l\/%L\ COL\ %c%=(%{&ff}/%Y)
set statusline=%{expand('%:p:h:t')}/%t%m%r%h%w%=LINE\ %l\/%L\ COL\ %c%=(%{&ff}/%Y)

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
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

iabbrev pdb __import__('pdb').set_trace()jj

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-R'
let Grep_Skip_Files = '*.log *.db *.pyc *.o *.exe *.min.js *.csv'
let Grep_Skip_Dirs = '.git node_modules venv env .tox __pycache__ target'
"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set nowrap
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
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
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
" nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>a :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" TELESCOPE.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,venv,__pycache__

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>e <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>gr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

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

"" GitGutterToggle
noremap <Leader>ç :GitGutterToggle<CR>
"*****************************************************************************
"" Custom configs
"*****************************************************************************
"-- AUTOCOMPLETION --
filetype plugin on

set omnifunc=syntaxcomplete#Complete

" c and cpp
autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab

" html, Scala and Groovy
autocmd Filetype groovy,html,scala setlocal ts=2 sw=2 expandtab

"" ignore all of tidy's warnings
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }

" vim-javascript
au BufRead,BufNewFile *.vue set filetype=javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
augroup END

" python
" vim-python
let g:python3_host_prog = "/usr/local/bin/python3.10"

augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 formatoptions+=croq softtabstop=4 cinwords=if,elif,else,for,while,try,except,finally,def,class,with,match,case
augroup END

"" Remove preview docstring window on top
""" https://github.com/davidhalter/jedi-vim/blob/master/doc/jedi-vim.txti
""" 6.2. `g:jedi#auto_vim_configuration` && 6.5. `g:jedi#auto_close_doc`
" set completeopt-=preview
set completeopt=menuone,noinsert,noselect

" syntastic
let g:syntastic_python_checkers=['flake8']

" GitGutter
" Start disabled
let g:gitgutter_enabled = 0
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

"" LSP CONFIG
lua << EOF
    local nvim_lsp = require('lspconfig')
    local cmp = require('cmp')

    cmp.setup {
        snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
        },

        sources = {
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' },
		},

        mapping = {
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
            ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        }
    }

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- Enable completion triggered by <c-x><c-o>
        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end

    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local servers = { 'rust_analyzer', 'vuels', 'jedi_language_server'}

    for _, server in ipairs(servers) do
        nvim_lsp[server].setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
            capabilities = capabilities
        })
    end

    local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
        float = {
            source = 'always'
        },
    })

    require('telescope').setup {
        defaults = {
            file_ignore_patterns = { ".git", "venv", "^core/static/core/js/"}
        },
        pickers = {
            find_files = {
                previewer = false,
                hidden = true,
                layout_config = {
                    -- prompt_position = "top",
                    width = 0.7
                },
            },
            live_grep = {
                layout_strategy = 'vertical',
                layout_config = {
                    -- prompt_position = "top",
                    -- mirror = true,
                    preview_height = 0.5,
                    width = 0.9,
                    height = 0.95
                },
            }
        },
    }
EOF
