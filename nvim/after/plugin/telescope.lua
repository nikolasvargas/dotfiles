-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

---@diagnostic disable-next-line: redundant-parameter
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--fixed-strings',
      '--trim',
      '-g', '!.git/',
    },
    extensions = {
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
        hidden = true,
        no_ignore = true,
        depth = 2,
        auto_depth = true,
      }
    },
    wrap_results = true,
    layout_strategy = "vertical",
    file_ignore_patterns = { ".git", ".github", "venv", "^core/static/core/js/", "node_modules", ".cache", "*.pyc", "*.min.js", "target"},
    mappings = {
      i = { ['<M-CR>'] = "select_tab" },
      n = { ['<M-CR>'] = "select_tab" },
    }
  },
  pickers = {
    find_files = {
      hidden=true,
      no_ignore=true,
      previewer=false,
    },
    git_files = {
      hidden=true,
      no_ignore=true,
      previewer=false,
    },
    lsp_references = {
      fname_width = 50,
      trim_text = true,
    }
  }
}
-- Enable telescope fzf native, if installed
-- pcall(t.load_extension, 'fzf')
-- pcall(t.load_extension, 'file_browser')

---@diagnostic disable-next-line: undefined-field
require('telescope').load_extension('fzf')
---@diagnostic disable-next-line: undefined-field
require('telescope').load_extension('file_browser')

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<C-f>', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    defauls = {
      mappings = {
        i = {
          ["<C-Down>"] = require('telescope.actions').cycle_history_next,
          ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
        },
      },
    },
    winblend = 1,
    layout_strategy = "vertical",
    layout_config = {
      height = 0.9,
      width = 0.95,
      prompt_position = "bottom"
    },
    wrap_results = true,
    previewer = true,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>e',  builtin.find_files, {})
vim.keymap.set('n', '<leader>gr', builtin.live_grep, {})

vim.keymap.set('n', '<leader>b',  builtin.buffers,     { desc = '[S]earch existing [B]uffers' })
vim.keymap.set('n', '<C-p>',      builtin.git_files,   { desc = 'Search only git files'	      })
vim.keymap.set('n', '<leader>sf', builtin.find_files,  { desc = '[S]earch [F]iles'	      })
vim.keymap.set('n', '<leader>sh', builtin.help_tags,   { desc = '[S]earch [H]elp'	      })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord'     })
vim.keymap.set('n', '<leader>sg', builtin.live_grep,   { desc = '[S]earch by [G]rep'	      })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics'      })
vim.keymap.set('n', '<leader>sr', builtin.resume,      { desc = '[S]earch on [R]esume'        })

-- vim.keymap.set('n', '<leader>f', function ()
  -- builtin.grep_string( { search = vim.fn.input("Grep > ") });
-- end)
