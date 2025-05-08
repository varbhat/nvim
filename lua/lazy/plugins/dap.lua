return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
      'marilari88/neotest-vitest',
      'mfussenegger/nvim-dap-python',
    },
    keys = function(_, keys)
      local dap = require 'dap'
      return {
        { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
        { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
        { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
        { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
        { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
        {
          '<leader>B',
          function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
          end,
          desc = 'Debug: Set [B]reakpoint',
        },
        unpack(keys),
      }
    end,
    config = function()
      local dap = require 'dap'

      vim.fn.sign_define('DapBreakpoint', {
        text = '--',
        texthl = 'DiagnosticError',
        numhl = '',
      })

      vim.fn.sign_define('DapStopped', {
        text = '->',
        texthl = 'DiagnosticHint',
        numhl = '',
      })

      -- configure widgets

      local widgets = require 'dap.ui.widgets'

      -- set scopes as right pane
      local scopes = widgets.sidebar(widgets.scopes, {}, 'vsplit')

      -- set frames as bottom pane
      local frames = widgets.sidebar(widgets.frames, { height = 10 }, 'belowright split')

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[d]ap [c]ontinue' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[d]ap step [o]ver' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[d]ap step [i]nto' })
      vim.keymap.set('n', '<leader>dC', dap.clear_breakpoints, { desc = '[d]ap [C]lear Breakpoints' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = '[d]ap [t]erminate' })

      local repl = require 'dap.repl'

      vim.keymap.set('n', '<leader>dR', function()
        return repl.toggle({}, 'belowright split')
      end)

      vim.keymap.set('n', '<leader>dS', scopes.toggle, { desc = '[d]ap [S]copes toggle' })
      vim.keymap.set('n', '<leader>df', frames.toggle, { desc = '[d]ap [f]rames toggle' })
      vim.keymap.set('n', '<leader>dW', widgets.hover, { desc = '[d]ap [W]idgets hover' })

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          'delve',
          'jq',
          'codelldb',
        },
      }

      require('dap-go').setup {
        delve = {
          -- On Windows delve must be run attached or it crashes.
          -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
          detached = vim.fn.has 'win32' == 0,
        },
      }
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'mrcjkb/rustaceanvim',
      {
        'fredrikaverpil/neotest-golang',
        dependencies = {
          {
            'leoluz/nvim-dap-go',
            opts = {},
          },
        },
        branch = 'main',
      },
    },
    keys = {
      { '<leader>t', '', desc = '+test' },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = 'Debug Nearest',
      },
      {
        '<leader>tt',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run File',
      },
      {
        '<leader>tT',
        function()
          require('neotest').run.run(vim.uv.cwd())
        end,
        desc = 'Run All Test Files',
      },
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run Nearest',
      },
      {
        '<leader>tl',
        function()
          require('neotest').run.run_last()
        end,
        desc = 'Run Last',
      },
      {
        '<leader>ts',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle Summary',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true, auto_close = true }
        end,
        desc = 'Show Output',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle Output Panel',
      },
      {
        '<leader>tS',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop',
      },
      {
        '<leader>tw',
        function()
          require('neotest').watch.toggle(vim.fn.expand '%')
        end,
        desc = 'Toggle Watch',
      },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-vitest',
          require 'rustaceanvim.neotest',
          require 'neotest-golang',
          require('dap-python').setup 'python',
        },
      }
    end,
  },
  {
    'Weissle/persistent-breakpoints.nvim',
    config = function()
      require('persistent-breakpoints').setup {
        load_breakpoints_event = { 'BufReadPost' },
      }
    end,
  },
  {
    'miroshQa/debugmaster.nvim',
    config = function()
      local dm = require 'debugmaster'
      vim.keymap.set({ 'n', 'v' }, '<leader>dm', dm.mode.toggle, { desc = '[D]ebug [M]ode', nowait = true })
      vim.keymap.set('t', '<C-/>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
    end,
  },
}
