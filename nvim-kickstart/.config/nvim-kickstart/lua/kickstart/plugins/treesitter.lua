return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'wit',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      keys = {
        { 'L', desc = 'Increment Selection' },
        { '<bs>', desc = 'Decrement Selection', mode = 'x' },
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'L',
          node_incremental = 'L',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.inner',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.inner',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.inner',
          },
        },
      },
    },

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
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
