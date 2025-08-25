-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

local fzf_opts = {
  fuzzy = true, -- false will only do exact matching
  override_generic_sorter = true, -- override the generic sorter
  override_file_sorter = true, -- override the file sorter
  case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
  -- the default case_mode is "smart_case"
}

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      {
        'fdschmidt93/telescope-egrepify.nvim',
        dependencies = {
          { 'nvim-telescope/telescope.nvim' },
        },
      },
      {
        'danielfalk/smart-open.nvim',
        dependencies = {
          { 'nvim-telescope/telescope.nvim' },
          { 'kkharji/sqlite.lua' },
          -- Only required if using match_algorithm fzf
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
          -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
          { 'nvim-telescope/telescope-fzy-native.nvim' },
        },
      },
      {
        'telescope-tmux.nvim',
        name = 'telescope-tmux.nvim',
        -- dev = true,
        { url = 'git@github.com:greenhat/telescope-tmux.nvim.git', branch = 'support-rust-test' },
        dependencies = {
          { 'nvim-telescope/telescope.nvim' },
        },
      },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
          -- ...
          mappings = {
            i = {
              ['<Esc>'] = 'close',
              ['<C-c>'] = false,
              ['<M-r>'] = 'select_default',
              ['<M-e>'] = 'select_default',
            },
            n = {
              -- ...
            },
          },
          -- path_display = {
          --   "shorten",
          -- },
          cache_picker = {
            num_pickers = 100,
            ignore_empty_prompt = true,
          },
        },
        -- via https://github.com/nvim-telescope/telescope.nvim/issues/2104
        pickers = {
          -- Manually set sorter, for some reason not picked up automatically
          lsp_dynamic_workspace_symbols = {
            sorter = require('telescope').extensions.fzf.native_fzf_sorter(fzf_opts),
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          fzf = fzf_opts,
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
      -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      -- vim.keymap.set(
      --   'n',
      --   '<leader>s.',
      --   builtin.oldfiles,
      --   { desc = '[S]earch Recent Files ("." for repeat)' }
      -- )
      -- vim.keymap.set(
      --   'n',
      --   '<leader><leader>',
      --   builtin.buffers,
      --   { desc = '[ ] Find existing buffers' }
      -- )

      local map = vim.keymap.set

      map(
        'n',
        '<leader><space>',
        -- "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", -- selects the last used buffer
        -- "<cmd>Telescope buffers sort_mru=true<cr>", -- selects the last used buffer
        -- desc = "Switch Buffer",
        "<cmd>lua require('telescope').extensions.smart_open.smart_open { cwd_only = true, filename_first = false, }<cr>",
        { desc = 'Smart open' }
      )

      map(
        'n',
        '<leader>,',
        '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', -- selects the last used buffer
        -- '<cmd>Telescope buffers sort_mru=true<cr>', -- selects the last used buffer
        { desc = 'Switch Buffer' }
      )

      map('n', '<leader>;', '<cmd>Telescope command_history<cr>', { desc = 'Command History' })
      -- { "<leader>e", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      map('n', '<leader>a', builtin.resume, { desc = 'Resume' })

      -- { "<leader>e", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope ext Frecency" },
      -- { "<leader>e", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      map('n', '<leader>/', '<cmd>Telescope egrepify<cr>', { desc = 'Telecope ext Egrepify' })
      map('n', '<leader>r', '<cmd>Telescope pickers<cr>', { desc = 'Cached Pickers' })
      map('n', '<leader>t', function()
        require('telescope').extensions.tmux.pane_file_paths {
          grep_cmd = 'rg -o',
          -- regex = "",
        }
      end, { desc = 'Telescope ext Tmux file paths' })
      map(
        'n',
        '<leader>e',
        '<cmd>Telescope diagnostics severity=error<cr>',
        { desc = 'Workspace errors' }
      )
      map(
        'n',
        '<leader>i',
        '<cmd>Telescope diagnostics severity_bound=warn<cr>',
        { desc = 'Workspace diagnostics' }
      )

      -- -- Slightly advanced example of overriding default behavior and theme
      -- vim.keymap.set('n', '<leader>/', function()
      --   -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      --     winblend = 10,
      --     previewer = false,
      --   })
      -- end, { desc = '[/] Fuzzily search in current buffer' })

      -- -- It's also possible to pass additional configuration options.
      -- --  See `:help telescope.builtin.live_grep()` for information about particular keys
      -- vim.keymap.set('n', '<leader>s/', function()
      --   builtin.live_grep {
      --     grep_open_files = true,
      --     prompt_title = 'Live Grep in Open Files',
      --   }
      -- end, { desc = '[S]earch [/] in Open Files' })

      -- -- Shortcut for searching your Neovim configuration files
      -- vim.keymap.set('n', '<leader>sn', function()
      --   builtin.find_files { cwd = vim.fn.stdpath 'config' }
      -- end, { desc = '[S]earch [N]eovim files' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
