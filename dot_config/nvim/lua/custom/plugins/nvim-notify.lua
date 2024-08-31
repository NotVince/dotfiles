return {
  {
    'rcarriga/nvim-notify',
    opts = {},
    config = function()
      vim.notify = require 'notify'

      local command = function()
        vim.notify.dismiss { silent = true, pending = true }
      end
      vim.keymap.set('n', '<leader>;', command, { desc = 'Dismiss notifications' })
    end,
  },
}
