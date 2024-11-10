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
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function()
      require('rose-pine').setup {
        variant = 'main',
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
        },

        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },

        highlight_groups = {
          TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
          TelescopeNormal = { bg = 'none' },
          TelescopePromptNormal = { bg = 'base' },
          TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
          TelescopeSelection = { fg = 'text', bg = 'base' },
          TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
        },
      }

      -- Load the colorscheme
      vim.cmd.colorscheme 'rose-pine-main'
    end,
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
