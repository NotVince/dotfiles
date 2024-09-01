return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = false,
        show_end_of_buffer = true,
        dim_inactive = {
          enabled = true,
          shade = 'dark',
          percentage = 0.05,
        },
        integrations = {
          notify = true,
        },
      }

      -- Load the colorscheme
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
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
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    { -- Useful plugin to show you pending keybinds.
      'folke/which-key.nvim',
      event = 'VimEnter', -- Sets the loading event to 'VimEnter'
      config = function() -- This is the function that runs, AFTER loading
        require('which-key').setup()

        -- Document existing key chains
        require('which-key').register {
          ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
          ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
          ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
          ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
          ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
          ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        }
        -- visual mode
        require('which-key').register({
          ['<leader>h'] = { 'Git [H]unk' },
        }, { mode = 'v' })
      end,
    },
  },
  {
    { -- Add indentation guides even on blank lines
      'lukas-reineke/indent-blankline.nvim',
      -- Enable `lukas-reineke/indent-blankline.nvim`
      -- See `:help ibl`
      main = 'ibl',
      opts = {},
    },
  },
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    keys = {
      { '<Leader>n', ':NoNeckPain<CR>' },
    },
  },
}
