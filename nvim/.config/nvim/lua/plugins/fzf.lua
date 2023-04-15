return {
  'ibhagwan/fzf-lua',
  config = function()
    require('fzf-lua').setup {
    }
    vim.keymap.set('n', '<leader>j', require('fzf-lua').lsp_live_workspace_symbols, { desc = 'Live workspace symbols' })
  end
}
