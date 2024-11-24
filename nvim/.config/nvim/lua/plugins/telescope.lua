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
            ["<M-r>"] = "select_default",
            ["<M-e>"] = "select_default",
          },
          n = {
            -- ...
          },
        },
        -- path_display = {
        --   "shorten",
        -- },
        cache_picker = {
          num_pickers = 100,
          ignore_empty_prompt = true,
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
      { "<leader>sp", "<cmd>Telescope lazy_plugins<cr>", desc = "Telescope ext Lazy Plugins" },
      { "<leader>e", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope ext Frecency" },
      { "<leader>/", "<cmd>Telescope egrepify<cr>", desc = "Telecope ext Egrepify" },
      { "<leader>r", "<cmd>Telescope pickers<cr>", desc = "Cached Pickers" },
      {
        "<leader>t",
        function()
          require("telescope").extensions.tmux.pane_file_paths({
            grep_cmd = "rg -o",
            -- regex = "",
          })
        end,
        desc = "Telescope ext Tmux file paths",
      },
    },
  },
  {
    -- "trevarj/telescope-tmux.nvim",
    "telescope-tmux.nvim",
    name = "telescope-tmux.nvim",
    dev = true,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
  },
  {
    "polirritmico/telescope-lazy-plugins.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      matcher = "fuzzy",
      -- default sorting function to combine recency and fzy score
      -- scoring_function = function(recency, fzy_score)
      --   return (10 / (recency == 0 and 1 or recency)) - 1 / fzy_score
      -- end,
    },
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
  },
}
