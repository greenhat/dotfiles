return {
  'dnlhc/glance.nvim',
  opts = function()
    local opts = {
      height = 30,
      mappings = {
        list = {
          ['<C-v>'] = require('glance').actions.jump_vsplit,
        },
      },
    }
    return opts
  end,
  keys = {
    { 'gd', '<cmd>Glance definitions<CR>', desc = 'Glance definitions' },
    { 'gy', '<cmd>Glance type_definitions<CR>', desc = 'Glance type definitions' },
  },
}
