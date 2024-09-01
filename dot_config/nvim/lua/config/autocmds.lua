vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#b4befe' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = '#b4befe' })
    vim.api.nvim_set_hl(0, 'IblScope', { fg = '#b4befe' })
  end,
})

-- only highlight when searching
vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == '/' or cmd == '?' then
      vim.opt.hlsearch = true
    end
  end,
})
vim.api.nvim_create_autocmd('CmdlineLeave', {
  callback = function()
    local cmd = vim.v.event.cmdtype
    if cmd == '/' or cmd == '?' then
      vim.opt.hlsearch = false
    end
  end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { timeout = 200 }
  end,
})

-- Disable auto comment
--vim.api.nvim_create_autocmd("BufEnter", {
--    callback = function()
--        vim.opt.formatoptions = { c = false, r = false, o = false }
--    end
--})

-- keymap for .cpp file
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.cpp', '*.cc' },
  callback = function()
    vim.keymap.set('n', '<leader>e', ':terminal ./a.out<CR>', { silent = true })
  end,
})

-- keymap for .go file
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.go' },
  callback = function()
    vim.keymap.set('n', '<leader>e', ':terminal go run %<CR>', { silent = true })
  end,
})

-- keymap for .py file
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.py' },
  callback = function()
    vim.keymap.set('n', '<leader>e', ':terminal python3 %<CR>', { silent = true })
  end,
})
