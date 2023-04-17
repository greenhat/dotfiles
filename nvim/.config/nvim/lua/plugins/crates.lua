return {
  'saecki/crates.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup()
    local crates = require('crates')

    vim.keymap.set('n', '<leader>ct', crates.toggle, { desc = 'Toggle crates.nvim' })
    vim.keymap.set('n', '<leader>cr', crates.reload, { desc = 'Reload crates.nvim' })

    vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, { desc = 'Show crate versions' })
    vim.keymap.set('n', '<leader>cf', crates.show_features_popup, { desc = 'Show crate features' })
    vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, { desc = 'Show crate dependencies' })

    vim.keymap.set('n', '<leader>cu', crates.update_crate, { desc = 'Update crate' })
    vim.keymap.set('v', '<leader>cu', crates.update_crates, { desc = 'Update selected crates' })
    vim.keymap.set('n', '<leader>ca', crates.update_all_crates, { desc = 'Update all crates' })
    vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, { desc = 'Upgrade crate' })
    vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, { desc = 'Upgrade selected crates' })
    vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, { desc = 'Upgrade all crates' })

    vim.keymap.set('n', '<leader>cH', crates.open_homepage, { desc = 'Open crate homepage' })
    vim.keymap.set('n', '<leader>cR', crates.open_repository, { desc = 'Open crate repository' })
    vim.keymap.set('n', '<leader>cD', crates.open_documentation, { desc = 'Open crate documentation' })
    vim.keymap.set('n', '<leader>cC', crates.open_crates_io, { desc = 'Open crates.io' })
  end
}
