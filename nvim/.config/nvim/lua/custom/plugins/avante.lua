local enable_autosuggestions = vim.env.NVIM_AVANTE_AUTOSUGGESTIONS

return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = 'claude',
    auto_suggestions_provider = 'deepseek',
    claude = {
      model = 'claude-3-5-sonnet-20241022',
      temperature = 0,
      max_tokens = 4096,
    },
    openai = {
      model = 'gpt-4o',
    },
    vendors = {
      ---@type AvanteSupportedProvider
      deepseek = {
        __inherited_from = 'openai',
        endpoint = 'https://api.deepseek.com',
        api_key_name = 'DEEPSEEK_API_KEY',
        model = 'deepseek-chat',
      },
      ---@type AvanteProvider
      mistral = {
        endpoint = 'https://codestral.mistral.ai/v1/chat/completions',
        api_key_name = 'MISTRAL_API_KEY',
        model = 'codestral-latest',
        parse_curl_args = function(opts, code_opts)
          local api_key = os.getenv(opts.api_key_name)
          local Llm = require 'avante.providers'
          return {
            url = opts.endpoint,
            headers = {
              ['Accept'] = 'application/json',
              ['Content-Type'] = 'application/json',
              ['Authorization'] = 'Bearer ' .. api_key,
            },
            body = {
              model = opts.model,
              messages = Llm.openai.parse_messages(code_opts),
              temperature = 0.7,
              max_tokens = 8192,
              stream = true,
              safe_prompt = false,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          local Llm = require 'avante.providers'
          Llm.openai.parse_response(data_stream, event_state, opts)
        end,
      },
    },
    dual_boost = {
      enabled = false,
      first_provider = 'mistral',
      second_provider = 'deepseek',
      prompt = 'Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]',
      timeout = 60000,
    },
    behaviour = {
      auto_suggestions = enable_autosuggestions ~= nil,
    },
    mappings = {
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<C-S-y>',
        next = '<C-S-j>',
        prev = '<C-S-k>',
        dismiss = '<C-S-h>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
