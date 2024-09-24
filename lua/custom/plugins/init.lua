-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {
  {
    -- Python debugger
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
    -- Vimtex install
    'lervag/vimtex',
    lazy = false,
  },
  {
    -- asynchronous IO, interact with tests
    'nvim-neotest/nvim-nio',
  },
  {
    -- commenting shortcuts
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
      -- gcc: comment/uncomment current line
      -- gc{motion}: comment/uncomment defined by a motion
      -- gc: visual mode comment/uncomment
      -- gcip: comment/uncomment a paragraph
      -- gcic: uncomment commented block
      -- dic: delete comment block
      -- gc4j: comment/uncomment 4 lines below current line
    end,
  },
  {
    -- ts/js/html autotag
    'windwp/nvim-ts-autotag',
  },
  {
    -- floating function signature (not working)
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
}

return plugins
