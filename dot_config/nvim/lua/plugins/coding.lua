return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },

  -- MINI - https://github.com/echasnovski/mini.nvim
  -- Collection of various small independent plugins/modules
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- TODO: test default nvim comments
      -- https://neovim.io/doc/user/various.html#commenting
      require('mini.comment').setup {
        mappings = {
          comment_line = '<C-_>',
          comment_visual = '<C-_>',
        },
      }

      -- Highlight word under cursor
      require('mini.cursorword').setup()

      -- Split arguments list
      -- toggle = 'gS'
      require('mini.splitjoin').setup()

      -- Jump navigation
      require('mini.jump2d').setup()

      -- Notifications
      local notify = require 'mini.notify'
      notify.setup {
        lsp_progress = { enable = false },
      }
      vim.notify = notify.make_notify {
        ERROR = { duration = 3000 },
        WARN = { duration = 3000 },
        INFO = { duration = 3000 },
      }

      local dismissCmd = function()
        -- vim.notify.dismiss { silent = true, pending = true }
        notify.clear()
      end
      vim.keymap.set('n', '<leader>;', dismissCmd, { desc = 'Dismiss notifications' })

      local showCmd = function()
        -- vim.notify.dismiss { silent = true, pending = true }
        notify.show_history()
      end
      vim.keymap.set('n', '<leader>sn', showCmd, { desc = 'Show notifications history' })

      -- Git diff in file
      -- NOTE: default keymap is gh
      -- require('mini.diff').setup()

      -- TODO fix background highlight
      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }

      -- Which key alternative
      local miniclue = require 'mini.clue'
      miniclue.setup {
        window = {
          delay = 300,
          config = {
            border = 'double',
            width = 'auto',
          },
        },
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<leader>' },
          { mode = 'x', keys = '<leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          -- custom clues
          { mode = 'n', keys = '<leader>c', desc = '[C]ode' },
          { mode = 'n', keys = '<leader>d', desc = '[D]ocument' },
          { mode = 'n', keys = '<leader>r', desc = '[R]ename' },
          { mode = 'n', keys = '<leader>s', desc = '[S]earch' },
          { mode = 'n', keys = '<leader>t', desc = '[T]oggle' },
          { mode = 'n', keys = '<leader>h', desc = 'Git [H]unk' },
          { mode = 'v', keys = '<leader>h', desc = 'Git [H]unk' },
        },
      }
    end,
  },
}
