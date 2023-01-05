-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local t = require('telescope')
t.setup {
  defaults = {
    file_ignore_patterns = { ".git", "venv", "^core/static/core/js/"},
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
-- Enable telescope fzf native, if installed
pcall(t.load_extension, 'fzf')

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>e',  builtin.find_files, {})
vim.keymap.set('n', '<C-p>',      builtin.git_files, {})
vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b',  builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>b',  builtin.buffers,     { desc = '[S]earch existing [B]uffers' })
vim.keymap.set('n', '<C-p>',      builtin.git_files,   { desc = 'Search only git files'	      })
vim.keymap.set('n', '<leader>sf', builtin.find_files,  { desc = '[S]earch [F]iles'	      })
vim.keymap.set('n', '<leader>sh', builtin.help_tags,   { desc = '[S]earch [H]elp'	      })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord'     })
vim.keymap.set('n', '<leader>sg', builtin.live_grep,   { desc = '[S]earch by [G]rep'	      })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics'      })
vim.keymap.set('n', '<leader>sr', builtin.resume,      { desc = '[S]earch on [R]esume'        })

-- vim.keymap.set('n', '<leader>f', function ()
-- 	builtin.grep_string( { search = vim.fn.input("Grep > ") });
-- end)
