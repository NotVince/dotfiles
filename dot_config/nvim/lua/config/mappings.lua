local function map(mode, lhs, rhs, opts)
  -- set default value if not specify
  if opts.noremap == nil then
    opts.noremap = true
  end
  if opts.silent == nil then
    opts.silent = true
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Scrolling
map('n', '<C-u>', '<C-u>zz', {})
map('n', '<C-d>', '<C-d>zz', {})
map('n', '<C-b>', '<C-b>zz', {})
map('n', '<C-f>', '<C-f>zz', {})

-- Leader movements
map('n', '<leader>w', ':write<CR>', { desc = 'Save file' })
map('n', '<leader>q', ':quit<CR>', { desc = 'Close file' })

-- Clear highlight search
map('n', '<Esc>', '<cmd>nohlsearch<CR>', {})

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>oq', vim.diagnostic.setloclist, { desc = '[O]pen diagnostic [Q]uickfix list' })

-- Close terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Helix goto movement
map({ 'n', 'v', 'o' }, 'gh', '0', {})
map({ 'n', 'v', 'o' }, 'gj', 'G', {})
map({ 'n', 'v', 'o' }, 'gk', 'gg', {})
map({ 'n', 'v', 'o' }, 'gl', '$', {})

-- Split navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- TODO test: system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', {})
map({ 'n' }, '<leader>Y', '"+y$', {})

map({ 'n', 'v' }, '<leader>p', '"+p', {})
map({ 'n', 'v' }, '<leader>P', '"+P', {})
