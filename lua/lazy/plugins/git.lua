return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'ibhagwan/fzf-lua', -- optional
    },
    keys = {
      { '<leader>eg', '<cmd>Neogit<cr>', desc = 'Neo[g]it' },
    },
    config = true,
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
}
