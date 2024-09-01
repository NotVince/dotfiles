return {
  {
    -- Display movement hints
    'tris203/precognition.nvim',
    opts = {
      startVisible = false,
    },
    vim.keymap.set('n', '<leader>tp', ':Precognition toggle<CR>', { desc = '[T]oggle [P]recognition' }),
  },
  {
    -- Block repetive commands
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {
      enabled = false,
      max_count = 3,
      allow_different_key = true,
      -- More hardtime
      hints = {
        ['[dcyvV][ia][%(%)]'] = {
          message = function(keys)
            return 'Use ' .. keys:sub(1, 2) .. 'b instead of ' .. keys
          end,
          length = 3,
        },
        ['ddO'] = {
          message = function(keys)
            return 'Use cc instead of ' .. keys
          end,
          length = 3,
        },
      },
    },
    vim.keymap.set('n', '<leader>th', ':Hardtime toggle<CR>', { desc = '[T]oggle [H]ardtime ' }),
  },
}
