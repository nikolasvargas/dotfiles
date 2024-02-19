require("nikolas")
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ","
vim.g.maplocalleader = ','

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moving blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-a>", "<esc>ggVG<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- split window
vim.keymap.set("n", "<Leader>h", ":<C-u>split<CR>")
vim.keymap.set("n", "<Leader>v", ":<C-u>vsplit<CR>")

-- switching windows
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

-- close buffer
vim.keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>")
-- vim.keymap.set("n", "<leader>q", ":bd<CR>")

-- buffer navigation
vim.keymap.set("n", "<leader>z", ":bp<CR>")
vim.keymap.set("n", "<leader>x", ":bn<CR>")
-- vim.keymap.set("n", "<leader>w", ":bn<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>y", [["_dP]])

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<Leader><space>", ":noh<CR>", { silent = true })
vim.keymap.set("n", "q", "<Nop>")

-- [[ Setting options ]]
-- See `:help vim.o`
-- clipboard
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = false

-- set colorcolumn
vim.opt.colorcolumn = "100"

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Wrap lines at all.
vim.wo.wrap = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'no'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Opens an edit command with the path of the currently edited file filled in
vim.keymap.set('n', ';e', ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Opens a tab edit command with the path of the currently edited file filled
vim.keymap.set('n', '<Leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set('n', '<Tab>', 'gt')
vim.keymap.set('n', ';t', ':tabnew<CR>')

-- disable statusline
vim.o.laststatus = 0
-- vim.cmd("set statusline=%{expand('%:p:h:t')}/%t%m%r%h%w%=LINE\\ %l\\/%L\\ COL\\ %c%=(%{&ff}/%Y)")
-- vim.cmd("set statusline=%f%m%r%h%w\\ \\ \\ L\\%l\\:%L\\ %c\\ (%{&ff}/%Y)")
-- vim.cmd("set statusline=%f%m%r%h%w%=L\\%l\\:%L\\ %c\\ (%{&ff}/%Y)")

-- winbar (statusline on top)
-- vim.cmd("set winbar=%f\\ %m\\ L%l\\:%L\\ %c\\ (%{&ff}/%Y)")
vim.api.nvim_set_hl(0, "WinBar", { bg = nil, fg = "#b288cf", bold=true })
vim.api.nvim_set_hl(0, "WinSeparator", { bg = nil, fg = "#ffffff" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = nil, fg = "#ffffff" })
vim.cmd("set winbar=%f\\ %m\\ (%{&ff}/%Y)")

vim.api.nvim_command('autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab')
vim.api.nvim_command('autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab')

-- Removing trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup('BuildOnSave', { clear = true }),
--   pattern  = "*.rs",
--   callback = function()
--     vim.cmd("!cargo build")
--   end,
-- })
--
