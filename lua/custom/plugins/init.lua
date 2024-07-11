-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
  {
    'mfussenegger/nvim-dap',
    keys = {
      {
        '<leader>db',
        '<cmd>DapToggleBreakpoint<CR>',
        mode = 'n',
        desc = '[D]ebug [B]reakpoint',
      },
    },
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function(_, opts)
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
    end,
    keys = {
      {
        '<leader>dpr',
        function()
          require('dap-python').test_method()
        end,
        mode = 'n',
        desc = '[D]ebug [P]ython [R]un',
      },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'lervag/vimtex',
    lazy = false,
  },
  {
    'neoclide/coc.nvim',
    branch = 'release',
  },
}

return plugins
