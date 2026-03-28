return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    -- Only one of these is needed.
    -- "nvim-telescope/telescope.nvim", -- optional
    -- "ibhagwan/fzf-lua", -- optional
    -- "echasnovski/mini.pick", -- optional
    'm00qek/baleia.nvim',
  },
  config = true,
  opts = {
    commit_editor = {
      staged_diff_split_kind = 'vsplit',
    },
    integrations = {
      telescope = true,
      codediff = true,
    },
    diff_viewer = 'codediff',
    log_pager = { 'delta', '--width', '117' },
  },
  keys = {
    {
      '<leader>gn',
      '<cmd>wa | Neogit<CR>',
      desc = 'Neogit',
    },
  },
}
