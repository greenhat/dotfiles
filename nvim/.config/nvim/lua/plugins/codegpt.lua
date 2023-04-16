return {
  'dpayne/CodeGPT.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('v', '<leader>gc', ':Chat', { desc = 'Chat with CodeGPT' })
  end
}
