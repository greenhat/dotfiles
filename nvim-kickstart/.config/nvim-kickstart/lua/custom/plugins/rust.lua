vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<C-e>', function()
        vim.cmd.RustLsp 'renderDiagnostic'
      end, { desc = 'Render diagnostic', buffer = bufnr })
      vim.keymap.set('n', ']r', '<cmd>RustLsp relatedDiagnostics<cr>')
      -- vim.keymap.set("n", "<leader>dr", function()
      --   vim.cmd.RustLsp("debuggables")
      -- end, { desc = "Rust Debuggables", buffer = bufnr })
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        inlayHints = {
          typeHints = {
            enable = false,
          },
          chainingHints = {
            enable = false,
          },
        },
        references = {
          excludeImports = true,
        },
        -- cargo = {
        --   allFeatures = true,
        --   loadOutDirsFromCheck = true,
        --   buildScripts = {
        --     enable = true,
        --   },
        -- },
        -- -- Add clippy lints for Rust.
        -- checkOnSave = true,
        -- procMacro = {
        --   enable = true,
        --   ignored = {
        --     ["async-trait"] = { "async_trait" },
        --     ["napi-derive"] = { "napi" },
        --     ["async-recursion"] = { "async_recursion" },
        --   },
        -- },
        check = {
          features = {},
          command = 'clippy',
        },
        diagnostics = {
          disabled = {
            'inactive-code',
          },
        },
      },
    },
  },
}
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
