return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- adapters
    'jfpedroza/neotest-elixir',
    'fredrikaverpil/neotest-golang',
  },
  config = function()
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'neotest-elixir' {},
        require 'neotest-golang' {},
      },
    }

    vim.keymap.set('n', '<leader>tt', neotest.run.run, { desc = '[T]est: nearest case' })
    vim.keymap.set('n', '<leader>tdt', function()
      neotest.run.run { strategy = 'dap' }
    end, { desc = '[T]est and [D]ebug: nearest case' })
    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = '[T]est: current file' })
    vim.keymap.set('n', '<leader>tdf', function()
      neotest.run.run { vim.fn.expand '%', strategy = 'dap' }
    end, { desc = '[T]est and [D]ebug: current file' })

    vim.keymap.set('n', '<leader>ts', neotest.summary.toggle)

    vim.keymap.set('n', '<leader>ta', function()
      neotest.run.run(vim.loop.cwd())
    end)
  end,
}
