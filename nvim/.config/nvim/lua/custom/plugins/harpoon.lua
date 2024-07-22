return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope.nvim' } },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {}

    vim.keymap.set('n', '<leader>hA', function()
      harpoon:list():append()
    end, { desc = '[H]arpoon: [A]dd' })
    vim.keymap.set('n', '<leader>hD', function()
      harpoon:list():remove()
    end, { desc = '[H]arpoon: [D]elete' })

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon: go to slot [A]' })
    vim.keymap.set('n', '<leader>hs', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon: go to slot [S]' })
    vim.keymap.set('n', '<leader>hd', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon: go to slot [D]' })
    vim.keymap.set('n', '<leader>hf', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon: go to slot [F]' })

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>sH', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[S]earch [H]arpoon' })
  end,
}
