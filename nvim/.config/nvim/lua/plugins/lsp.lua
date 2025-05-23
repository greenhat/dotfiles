-- LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }
    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    keys[#keys + 1] = {
      "<leader>o",
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = LazyVim.config.get_kind_filter(),
        })
      end,
      desc = "Goto Symbol",
    }
    keys[#keys + 1] = {
      "<leader>n",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          symbols = LazyVim.config.get_kind_filter(),
          -- path_display = "hidden",
        })
      end,
      desc = "Goto Symbol (Workspace)",
    }
    keys[#keys + 1] = {
      "gd",
      false,
      --   function()
      --     require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
      --   end,
      --   desc = "Goto Definition",
      --   has = "definition",
    }
    keys[#keys + 1] = {
      "gl",
      vim.lsp.buf.declaration,
      desc = "Goto declaration",
      has = "declaration",
    }
    keys[#keys + 1] = {
      "gD",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "Goto Definition",
      has = "definition",
    }
    keys[#keys + 1] = {
      "gy",
      false,
      -- function()
      --   require("telescope.builtin").lsp_type_definitions({ jump_type = "vsplit" })
      -- end,
      -- desc = "Goto T[y]pe Definition in vsplit",
    }
    keys[#keys + 1] = {
      "gY",
      function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    }
    keys[#keys + 1] = {
      "gi",
      function()
        require("telescope.builtin").lsp_implementations({ reuse_win = false })
      end,
      desc = "Goto Implementation",
    }
    keys[#keys + 1] = {
      "<M-r>",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v", "i" },
      has = "codeAction",
    }
    keys[#keys + 1] = {
      "<M-e>",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v", "i" },
      has = "codeAction",
    }
  end,
}
