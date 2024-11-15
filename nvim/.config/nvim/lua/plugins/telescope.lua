return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "polirritmico/telescope-lazy-plugins.nvim" },
      { "nvim-telescope/telescope-frecency.nvim" },
      { "fdschmidt93/telescope-egrepify.nvim" },
    },
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
            ["<M-r>"] = "select_default",
          },
          n = {
            -- ...
          },
        },
        -- path_display = {
        --   "shorten",
        -- },
      },
      extensions = {
        frecency = {
          matcher = "fuzzy",
          -- default sorting function to combine recency and fzy score
          -- scoring_function = function(recency, fzy_score)
          --   return (10 / (recency == 0 and 1 or recency)) - 1 / fzy_score
          -- end,
        },
      },
    },

    keys = {
      {
        "<leader><space>",
        -- "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", -- selects the last used buffer
        "<cmd>Telescope buffers sort_mru=true <cr>",
        desc = "Switch Buffer",
      },
      { "<leader>;", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- { "<leader>e", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader>a", LazyVim.pick("resume"), desc = "Resume" },
      { "<leader>sp", "<cmd>Telescope lazy_plugins", desc = "Telescope ext Lazy Plugins" },
      { "<leader>e", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope ext Frecency" },
      { "<leader>/", "<cmd>Telescope egrepify<cr>", desc = "Telecope ext Egrepify" },
    },
  },
}
