return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    config = function()
      -- require('nvim-treesitter').install { 'rust' }
      -- incremental selection treesitter/lsp
      vim.keymap.set({ 'n', 'x', 'o' }, 'L', function()
        if vim.treesitter.get_parser(nil, nil, { error = false }) then
          require('vim.treesitter._select').select_parent(vim.v.count1)
        else
          vim.lsp.buf.selection_range(vim.v.count1)
        end
      end, { desc = 'Select parent treesitter node or outer incremental lsp selections' })

      vim.keymap.set({ 'n', 'x', 'o' }, 'H', function()
        if vim.treesitter.get_parser(nil, nil, { error = false }) then
          require('vim.treesitter._select').select_child(vim.v.count1)
        else
          vim.lsp.buf.selection_range(-vim.v.count1)
        end
      end, { desc = 'Select child treesitter node or inner incremental lsp selections' })
    end,
  },
  -- -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  -- opts = {
  --   ensure_installed = {
  --     'bash',
  --     'c',
  --     'diff',
  --     'html',
  --     'lua',
  --     'luadoc',
  --     'markdown',
  --     'markdown_inline',
  --     'query',
  --     'vim',
  --     'vimdoc',
  --     'wit',
  --   },
  --   -- Autoinstall languages that are not installed
  --   auto_install = true,
  --   highlight = {
  --     enable = true,
  --     -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
  --     --  If you are experiencing weird indenting issues, add the language to
  --     --  the list of additional_vim_regex_highlighting and disabled languages for indent.
  --     additional_vim_regex_highlighting = { 'ruby' },
  --   },
  --   indent = { enable = true, disable = { 'ruby' } },
  --   keys = {
  --     { 'L', desc = 'Increment Selection' },
  --     { '<bs>', desc = 'Decrement Selection', mode = 'x' },
  --   },
  --
  --   incremental_selection = {
  --     enable = true,
  --     keymaps = {
  --       init_selection = 'L',
  --       node_incremental = 'L',
  --       scope_incremental = false,
  --       node_decremental = '<bs>',
  --     },
  --   },
  --
  --   textobjects = {
  --     move = {
  --       enable = true,
  --       goto_next_start = {
  --         [']f'] = '@function.outer',
  --         [']c'] = '@class.outer',
  --         [']a'] = '@parameter.inner',
  --       },
  --       goto_next_end = {
  --         [']F'] = '@function.outer',
  --         [']C'] = '@class.outer',
  --         [']A'] = '@parameter.inner',
  --       },
  --       goto_previous_start = {
  --         ['[f'] = '@function.outer',
  --         ['[c'] = '@class.outer',
  --         ['[a'] = '@parameter.inner',
  --       },
  --       goto_previous_end = {
  --         ['[F'] = '@function.outer',
  --         ['[C'] = '@class.outer',
  --         ['[A'] = '@parameter.inner',
  --       },
  --     },
  --   },
  -- },

  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    config = function()
      require('nvim-treesitter-textobjects').setup {
        move = {
          set_jumps = false,

          -- enable = true,
          --
          -- goto_next_start = {
          --   [']f'] = '@function.outer',
          --   [']c'] = '@class.outer',
          --   [']a'] = '@parameter.inner',
          -- },
          -- goto_next_end = {
          --   [']F'] = '@function.outer',
          --   [']C'] = '@class.outer',
          --   [']A'] = '@parameter.inner',
          -- },
          -- goto_previous_start = {
          --   ['[f'] = '@function.outer',
          --   ['[c'] = '@class.outer',
          --   ['[a'] = '@parameter.inner',
          -- },
          -- goto_previous_end = {
          --   ['[F'] = '@function.outer',
          --   ['[C'] = '@class.outer',
          --   ['[A'] = '@parameter.inner',
          -- },
        },
      }

      -- keymaps
      -- You can use the capture groups defined in `textobjects.scm`
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
        require('nvim-treesitter-textobjects.move').goto_next_start(
          '@function.outer',
          'textobjects'
        )
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
      end)
      -- -- You can also pass a list to group multiple queries.
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']o', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_start(
      --     { '@loop.inner', '@loop.outer' },
      --     'textobjects'
      --   )
      -- end)
      -- -- You can also use captures from other query groups like `locals.scm` or `folds.scm`
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']s', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_start('@local.scope', 'locals')
      -- end)
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']z', function()
      --   require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
      -- end)

      vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start(
          '@function.outer',
          'textobjects'
        )
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start(
          '@class.outer',
          'textobjects'
        )
      end)

      vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end(
          '@function.outer',
          'textobjects'
        )
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
      end)

      -- Go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- vim.keymap.set({ 'n', 'x', 'o' }, ']d', function()
      --   require('nvim-treesitter-textobjects.move').goto_next('@conditional.outer', 'textobjects')
      -- end)
      -- vim.keymap.set({ 'n', 'x', 'o' }, '[d', function()
      --   require('nvim-treesitter-textobjects.move').goto_previous(
      --     '@conditional.outer',
      --     'textobjects'
      --   )
      -- end)
    end,
  },

  -- Show context of the current function
  {
    'nvim-treesitter/nvim-treesitter-context',
    -- event = 'LazyFile',
    opts = function()
      local tsc = require 'treesitter-context'
      -- Snacks.toggle({
      -- name = 'Treesitter Context',
      -- get = tsc.enabled,
      -- set = function(state)
      -- if state then
      tsc.enable()
      -- else
      -- tsc.disable()
      -- end
      -- end,
      -- }):map '<leader>ut'
      -- return { mode = 'cursor', max_lines = 3 }
    end,
  },

  {
    'folke/ts-comments.nvim',
    opts = {
      lang = {
        wit = '// %s',
      },
    },
    event = 'VeryLazy',
  },
}
-- vim: ts=2 sts=2 sw=2 et
