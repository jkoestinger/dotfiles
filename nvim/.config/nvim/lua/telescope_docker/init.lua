local pickers = require 'telescope.pickers'
local config = require('telescope.config').values
local finders = require 'telescope.finders'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local previewers = require 'telescope.previewers'
local utils = require 'telescope.previewers.utils'

local M = {}

M.show_docker_containers = function(opts)
  pickers
    .new(opts, {
      finder = finders.new_async_job {
        command_generator = function()
          return { 'docker', 'container', 'ls', '--format', 'json' }
        end,
        entry_maker = function(entry)
          local parsed = vim.json.decode(entry)

          if parsed then
            return {
              value = parsed,
              display = parsed.Names,
              ordinal = parsed.Names,
            }
          end
        end,
      },
      sorter = config.generic_sorter(opts),
      previewer = previewers.new_buffer_previewer {
        title = 'Docker Container Logs',
        define_preview = function(self, entry)
          local cmd = '!docker container logs --tail 200 ' .. entry.value.ID
          local result = vim.api.nvim_exec2(cmd, { output = true })

          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, true, vim.split(result.output, '\n'))
          utils.highlighter(self.state.bufnr, 'markdown')
        end,
      },

      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          local command = {
            ':vsplit',
            'term://docker',
            'container',
            'logs',
            '-f',
            selection.value.ID,
          }

          vim.cmd(vim.fn.join(command, ' '))
        end)
        return true
      end,
    })
    :find()
end

M.show_docker_containers()

return M
