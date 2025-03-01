return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'OXY2DEV/markview.nvim',
      ft = { 'markdown', 'codecompanion' },
      opts = {
        preview = {
          filetypes = { 'markdown', 'codecompanion' },
          ignore_buftypes = {},
        },
      },
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'deepseek',
      },
      inline = {
        adapter = 'deepseek_chat',
      },
    },
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240,
        layout = 'vertical',
        opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
        provider = 'mini_diff',
      },
    },
    adapters = {
      deepseek_chat = function()
        return require('codecompanion.adapters').extend('deepseek', {
          schema = {
            model = {
              default = 'deepseek-chat',
            },
          },
        })
      end,
    },
  },
}
