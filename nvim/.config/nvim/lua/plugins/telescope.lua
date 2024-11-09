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
  },
}
