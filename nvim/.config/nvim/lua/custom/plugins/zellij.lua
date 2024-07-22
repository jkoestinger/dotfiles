return {
  'https://github.com/fresh2dev/zellij.vim.git',
  lazy = false,
  keys = {
    { '<leader>zz', ':ZellijNewPane<CR>', mode = { 'n' }, { noremap = true } },
    { '<leader>zh', ':ZellijNewPaneSplit<CR>', mode = { 'n' }, { noremap = true } },
    { '<leader>zv', ':ZellijNewPaneVSplit<CR>', mode = { 'n' }, { noremap = true } },
  },
}
