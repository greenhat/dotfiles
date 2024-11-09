return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        -- ...
        mappings = {
          i = {
            ["<Esc>"] = "close",
            ["<C-c>"] = false,
          },
          n = {
            -- ...
          },
        },
        -- path_display = {
        --   "shorten",
        -- },
      },
    },
    keys = {
      {
        "<leader><space>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      { "<leader>;", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>e", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    },
  },
}
