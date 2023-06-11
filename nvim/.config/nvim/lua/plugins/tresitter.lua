return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-textsubjects',
  },
  build = ":TSUpdate",
  config = function()
    local highlight_enabled = true
    if vim.g.vscode then
      highlight_enabled = false
    end
    -- [[ Configure Treesitter ]]
    -- See `:help nvim-treesitter`
    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { "lua", "rust", "scala", "toml", "bash", "c", "cmake", "comment", "cpp", "css", "dockerfile",
        "html", "java", "javascript", "jsdoc", "json", "kotlin", "python", "regex", "typescript", "yaml" },
      highlight = { enable = highlight_enabled },
      indent = { enable = true, disable = { 'python' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          scope_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
        },
      },
      textsubjects = {
        enable = true,
        keymaps = {
          [';'] = 'textsubjects-smart',
          ['.'] = 'textsubjects-container-outer',
          ['i.'] = 'textsubjects-container-inner',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['al'] = '@call.outer',
            ['il'] = '@call.inner',
            ['aC'] = '@conditional.outer',
            ['iC'] = '@conditional.inner',
            ['ab'] = '@block.outer',
            ['ib'] = '@block.inner',
            ['ia'] = '@parameter.inner',
            ['aa'] = '@parameter.outer',
            ['as'] = '@statement.outer',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        lsp_interop = {
          enable = false,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ['<leader>pdf'] = '@function.outer',
            ['<leader>pdF'] = '@class.outer',
          },
        },
        -- swap = {
        --   enable = true,
        --   swap_next = {
        --     ['<leader>a'] = '@parameter.inner',
        --   },
        --   swap_previous = {
        --     ['<leader>A'] = '@parameter.inner',
        --   },
        -- },
      },
    }
  end
}
