return {
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    }, -- use if prefer nvim-web-devicons
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {}
    end,
    keys = {
      {
        '<leader>ss',
        '<cmd>FzfLua<cr>',
        desc = '[S]earch [S]elect FzfLua',
      },
      {
        '<leader>sh',
        function()
          require('fzf-lua').helptags()
        end,
        desc = '[S]earch [H]elp',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sk',
        function()
          require('fzf-lua').keymaps()
        end,
        desc = '[S]earch [K]eymaps',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sf',
        function()
          require('fzf-lua').files()
        end,
        desc = '[S]earch [F]iles',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sw',
        function()
          require('fzf-lua').grep_cword()
        end,
        desc = '[S]earch [w]ord',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sW',
        function()
          require('fzf-lua').grep_cWORD()
        end,
        desc = '[S]earch [W]ORD',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sG',
        function()
          require('fzf-lua').git_files()
        end,
        desc = '[S]earch [G]it Files',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sg',
        function()
          require('fzf-lua').live_grep()
        end,
        desc = '[S]earch live [g]rep',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sd',
        function()
          require('fzf-lua').diagnostics_document()
        end,
        desc = '[S]earch Document [d]iagnostics',
        mode = { 'n', 'v' },
      },
      {
        '<leader>s=',
        function()
          require('fzf-lua').resume()
        end,
        desc = '[S]earch Resume',
        mode = { 'n', 'v' },
      },
      {
        '<leader>s.',
        function()
          require('fzf-lua').oldfiles()
        end,
        desc = '[S]earch Recent Files("." for repeat)',
        mode = { 'n', 'v' },
      },
      {
        '<leader><leader>',
        function()
          require('fzf-lua').buffers()
        end,
        desc = '[ ] Find existing buffers',
        mode = { 'n', 'v' },
      },
      {
        '<leader>/',
        function()
          require('fzf-lua').lgrep_curbuf()
        end,
        desc = '[/] Fuzzily search in current buffer',
        mode = { 'n', 'v' },
      },
      {
        '<leader>s/',
        function()
          require('fzf-lua').lines()
        end,
        desc = '[S]earch [/] in Open Files',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sL',
        function()
          require('fzf-lua').live_grep_glob()
        end,
        desc = '[S]earch [L]ive Grep Glob',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sL',
        function()
          require('fzf-lua').live_grep_glob()
        end,
        desc = '[S]earch [L]ive Grep Glob',
        mode = { 'n', 'v' },
      },
      {
        '<leader>sR',
        function()
          require('fzf-lua').registers()
        end,
        desc = '[S]earch [R]egisters',
        mode = { 'n', 'v' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
