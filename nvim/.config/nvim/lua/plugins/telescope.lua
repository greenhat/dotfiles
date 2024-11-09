return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
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
