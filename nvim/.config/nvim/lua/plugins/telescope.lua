local fzf_opts = {
  fuzzy = true, -- false will only do exact matching
  override_generic_sorter = true, -- override the generic sorter
  override_file_sorter = true, -- override the file sorter
  case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  -- the default case_mode is "smart_case"
}

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
      -- via https://github.com/nvim-telescope/telescope.nvim/issues/2104
      pickers = {
        -- Manually set sorter, for some reason not picked up automatically
        lsp_dynamic_workspace_symbols = {
          sorter = require("telescope").extensions.fzf.native_fzf_sorter(fzf_opts),
        },
      },
      extensions = {
        fzf = fzf_opts,
      },
    },

    keys = {
      {
        "<leader><space>",
        -- "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", -- selects the last used buffer
        -- "<cmd>Telescope buffers sort_mru=true<cr>", -- selects the last used buffer
        -- desc = "Switch Buffer",
        "<cmd>lua require('telescope').extensions.smart_open.smart_open { cwd_only = true, filename_first = false, }<cr>",
        desc = "Smart open",
      },
      { "<leader>;", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- { "<leader>e", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader>a", LazyVim.pick("resume"), desc = "Resume" },
      { "<leader>sp", "<cmd>Telescope lazy_plugins<cr>", desc = "Telescope ext Lazy Plugins" },
      -- { "<leader>e", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "Telescope ext Frecency" },
      -- { "<leader>e", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
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
      { "<leader>e", "<cmd>Telescope diagnostics severity=error<cr>", desc = "Workspace errors" },
      { "<leader>i", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
    },
  },
  {
    -- "trevarj/telescope-tmux.nvim",
    "telescope-tmux.nvim",
    { url = "git@github.com:greenhat/telescope-tmux.nvim.git" },
    name = "telescope-tmux.nvim",
    -- dev = true,
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
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   dependencies = {
  --     { "nvim-telescope/telescope.nvim" },
  --   },
  --   opts = {
  --     matcher = "fuzzy",
  --     -- default sorting function to combine recency and fzy score
  --     -- scoring_function = function(recency, fzy_score)
  --     --   return (10 / (recency == 0 and 1 or recency)) - 1 / fzy_score
  --     -- end,
  --   },
  -- },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
  },
  {
    "danielfalk/smart-open.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "kkharji/sqlite.lua" },
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
}
