return {
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
    command = 'Hardtime',
    event = 'BufEnter',
    -- "n" gets remapped
    -- keys = {
    --   { "n", "j", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    --   { "n", "k", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    --   { "n", "gj", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    --   { "n", "gk", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    -- },
  },
  {
    'akinsho/git-conflict.nvim',
    config = true,
  },
  {
    -- https://github.com/folke/lazy.nvim/discussions/463
    'glacambre/firenvim',
    -- cond = not not vim.g.started_by_firenvim,
    lazy = not vim.g.started_by_firenvim,
    module = false,
    build = function()
      vim.fn['firenvim#install'](0)
    end,
    -- DOES NOT WORK
    -- configure FireNvim here:
    -- config = function()
    --   vim.g.firenvim_config = {
    --     -- config values, like in my case:
    --     localSettings = {
    --       [".*"] = {
    --         takeover = "never",
    --       },
    --     },
    --   }
    -- end,
    -- { "noice.nvim", cond = not vim.g.started_by_firenvim },
    { 'lualine.nvim', cond = not vim.g.started_by_firenvim }, -- not useful in the browser
  },
  {
    'alexghergh/nvim-tmux-navigation',
    lazy = false,
    -- config = function()
    --   local nvim_tmux_nav = require("nvim-tmux-navigation")
    --
    --   nvim_tmux_nav.setup({
    --     disable_when_zoomed = true, -- defaults to false
    --   })
    --
    --   vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    --   vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    --   vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    --   vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    --   vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    --   vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    -- end,
    opts = {
      disable_when_zoomed = true,
    },
    keys = {
      {
        '<M-h>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateLeft()
        end,
        desc = 'tmux nav left',
      },
      {
        '<M-j>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateDown()
        end,
        desc = 'tmux nav down',
      },
      {
        '<M-k>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateUp()
        end,
        desc = 'tmux nav up',
      },
      {
        '<M-l>',
        function()
          require('nvim-tmux-navigation').NvimTmuxNavigateRight()
        end,
        desc = 'tmux nav right',
      },
    },
  },
  {
    'olimorris/persisted.nvim',
    lazy = false,
    -- event = 'BufReadPre', -- Ensure the plugin loads only when a buffer has been loaded
    opts = {
      use_git_branch = true,
      autoload = true,
    },
  },
  -- {
  --   'kylechui/nvim-surround',
  --   version = '^3.0.0', -- Use for stability; omit to use `main` branch for the latest features
  --   event = 'VeryLazy',
  --   config = function()
  --     require('nvim-surround').setup {
  --       keymaps = {
  --         insert = '<C-g>s',
  --         insert_line = '<C-g>S',
  --         normal = 'gsy',
  --         normal_cur = 'gsys',
  --         normal_line = 'gsyS',
  --         normal_cur_line = 'gsySS',
  --         visual = 'gss',
  --         visual_line = 'gsS',
  --         delete = 'gsd',
  --         change = 'gsc',
  --         change_line = 'gsC',
  --       },
  --     }
  --   end,
  -- },
  {
    'gbprod/yanky.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { '<leader>p', '<cmd>YankyRingHistory<cr>', mode = { 'n', 'x' }, desc = 'Open Yank History' },
      { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
      { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
      {
        'P',
        '<Plug>(YankyPutBefore)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text before cursor',
      },
      {
        'gp',
        '<Plug>(YankyGPutAfter)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text after selection',
      },
      {
        'gP',
        '<Plug>(YankyGPutBefore)',
        mode = { 'n', 'x' },
        desc = 'Put yanked text before selection',
      },
      {
        '<c-p>',
        '<Plug>(YankyPreviousEntry)',
        desc = 'Select previous entry through yank history',
      },
      { '<c-n>', '<Plug>(YankyNextEntry)', desc = 'Select next entry through yank history' },
      {
        ']p',
        '<Plug>(YankyPutIndentAfterLinewise)',
        desc = 'Put indented after cursor (linewise)',
      },
      {
        '[p',
        '<Plug>(YankyPutIndentBeforeLinewise)',
        desc = 'Put indented before cursor (linewise)',
      },
      {
        ']P',
        '<Plug>(YankyPutIndentAfterLinewise)',
        desc = 'Put indented after cursor (linewise)',
      },
      {
        '[P',
        '<Plug>(YankyPutIndentBeforeLinewise)',
        desc = 'Put indented before cursor (linewise)',
      },
      { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
      { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
      { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
      { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
      { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
      { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
    },
  },
  {
    'Apeiros-46B/qalc.nvim',
    opt = {},
  },
  {
    'linrongbin16/gitlinker.nvim',
    cmd = 'GitLink',
    opts = {},
    keys = {
      { '<leader>gy', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank git link' },
      { '<leader>gY', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
    },
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'igorlfs/nvim-dap-view',
      config = function()
        local map = vim.keymap.set
        map(
          'n',
          '<leader>dv',
          "<cmd>lua require'dap-view'.toggle()<cr>",
          { desc = 'Toggle DAP view' }
        )
      end,
    },
    config = function()
      local dap = require 'dap'
      dap.defaults.fallback.terminal_win_cmd = '100vsplit new'
      -- dap.defaults.fallback.focus_terminal = true

      local map = vim.keymap.set

      map(
        'n',
        '<leader>db',
        "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
        { desc = 'Toggle breakpoint' }
      )
      map('n', '<leader>dn', "<cmd>lua require'dap'.continue()<cr>", { desc = 'Debug continue' })
      map('n', '<leader>de', "<cmd>lua require'dap'.step_over()<cr>", { desc = 'Debug step over' })
      map('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", { desc = 'Debug step into' })
      map('n', '<leader>do', "<cmd>lua require'dap'.step_out()<cr>", { desc = 'Debug step out' })
      map('n', '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", { desc = 'Debug terminate' })
      map(
        'n',
        '<leader>dh',
        "<cmd>lua require('dap.ui.widgets').hover()<cr>",
        { desc = 'Debug: view expression under cursor' }
      )
    end,
  },
}
