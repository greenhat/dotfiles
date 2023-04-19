return {
  'ibhagwan/fzf-lua',
  config = function()
    require('fzf-lua').setup {
      winopts = {
        preview = {
          layout = 'vertical' }
      },
      lsp = {
        -- cwd_only = true,
        includeDeclaration = false,
        symbols = {
          symbol_style = 2,
        }
      },
      diagnostics = {
        cwd_only = true,
      }
    }
    vim.keymap.set('n', '<leader>f', require('fzf-lua').files, { desc = 'Files' })
    vim.keymap.set('n', '<leader>b', require('fzf-lua').buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>sp', require('fzf-lua').live_grep_glob, { desc = 'Live grep with glob' })
    vim.keymap.set('n', '<leader>sw', require('fzf-lua').grep_cword, { desc = 'Grep word under cursor' })
    vim.keymap.set('n', '<leader>sW', require('fzf-lua').grep_cWORD, { desc = 'Grep WORD under cursor' })
    vim.keymap.set('n', '<leader>sh', require('fzf-lua').help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>sk', require('fzf-lua').keymaps, { desc = 'Keymaps' })
    -- vim.keymap.set('n', '<leader>c', require('fzf-lua').commands, { desc = 'Commands' })
    vim.keymap.set('n', '<leader>;', require('fzf-lua').command_history, { desc = 'Commands history' })
    vim.keymap.set('n', '<leader>vb', require('fzf-lua').git_branches, { desc = 'Git branches' })
  end
}
