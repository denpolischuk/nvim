return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        theme = 'codedark',
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = ' ', right = ' ' },
      },

      sections = {
        -- Left
        lualine_a = { 'mode' },           -- mode (normal/insert/visual/etc)
        lualine_b = { 'branch', 'diff' }, -- Git branch + added/modified/removed
        lualine_c = {
          { 'diagnostics' },              -- LSP diagnostics
          {
            'buffers',
            show_filename_only = true,       -- Shows shortened relative path when set to false.
            hide_filename_extension = false, -- Hide filename extension when set to true.
            show_modified_status = true,     -- Shows indicator when the buffer is modified.

            mode = 2,                        -- 0: Shows buffer name
            -- 1: Shows buffer index
            -- 2: Shows buffer name + buffer index
            -- 3: Shows buffer number
            -- 4: Shows buffer name + buffer number

            use_mode_colors = true,

            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,

            filetype_names = {
              fzf = 'FZF',
              yazi = 'Yazi',
            },

            buffers_color = {
              -- Same values as the general color option can be used here.
              active = 'lualine_a_normal', -- Color for active buffer.
              inactive = 'lualine_a_inactive', -- Color for inactive buffer.
            },
          }
        },

        -- Right
        lualine_x = {
          {
            'filename',
            path = 1,
          },
          { 'filetype' }, -- lua, js, etc
          {
            function()
              local msg = 'No Active Lsp'
              local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = ' LSP:',
            color = { fg = '#ffffff', gui = 'bold' },
          },
        },

        lualine_y = { 'progress' }, -- % through file
        lualine_z = { 'location' }, -- line:column
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },

      tabline = {},
      extensions = { 'quickfix' }
    }
  end,
}
