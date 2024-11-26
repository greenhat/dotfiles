return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    -- "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua", -- optional
    -- "echasnovski/mini.pick", -- optional
  },
  config = true,
  opts = {
    commit_editor = {
      staged_diff_split_kind = "vsplit",
    },
  },
  keys = {
    {
      "<leader>gn",
      "<cmd>wa | Neogit<CR>",
      desc = "Neogit",
    },
  },
}
