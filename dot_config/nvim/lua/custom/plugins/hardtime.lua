return {
  {
    'tris203/precognition.nvim',
    opts = {},
  },
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {},

    vim.keymap.set('n', '<leader>th', ':Hardtime toggle<CR>:Precognition toggle<CR>', { desc = '[T]oggle [H]ardtime and Precognition' }),
  },
}
