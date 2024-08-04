vim.keymap.set('n', '<space>td', function()
  require('dap-go').debug_test()
end, { buffer = 0, desc = 'Debug Nearest' })
