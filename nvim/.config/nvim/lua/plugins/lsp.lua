return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    {
      'williamboman/mason.nvim',
      config = true,
      dependencies = {
        'ray-x/lsp_signature.nvim',
        {
          'lvimuser/lsp-inlayhints.nvim',
          config = function()
            require('lsp-inlayhints').setup()
          end
        },
      }
    },
    'williamboman/mason-lspconfig.nvim',
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    {
      'folke/neodev.nvim',
      config = function()
        -- Setup neovim lua configuration
        require('neodev').setup()
      end
    },
    {
      'scalameta/nvim-metals',
      dependencies = {
        'nvim-lua/plenary.nvim',
      }
    },
    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
        -- vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        --   { silent = true, noremap = true }
        -- )
        vim.keymap.set("n", "<leader>e", "<cmd>TroubleToggle workspace_diagnostics<cr>",
          { silent = true, noremap = true }
        )
        -- vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
        --   { silent = true, noremap = true }
        -- )
        -- vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        --   { silent = true, noremap = true }
        -- )
        -- vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        --   { silent = true, noremap = true }
        -- )
        -- vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
        --   { silent = true, noremap = true }
        -- )

        vim.keymap.set('n', '[t',
          function()
            require("trouble").previous({ skip_groups = true, jump = true });
          end,
          { desc = "Go to previous trouble message" })

        vim.keymap.set('n', ']t',
          function()
            require("trouble").next({ skip_groups = true, jump = true });
          end,
          { desc = "Go to next trouble message" })
      end
    }
  },
  config = function()
  end
}
