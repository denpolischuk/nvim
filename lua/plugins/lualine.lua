return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      options = {
        theme = 'base16',
        icons_enabled = true,
        globalstatus = true,
      },

      sections = {
        -- Left
        lualine_a = { 'mode' },           -- mode (normal/insert/visual/etc)
        lualine_b = { 'branch', 'diff' }, -- Git branch + added/modified/removed
        lualine_c = {
          { 'filename',   path = 1 },     -- relative path
          { 'diagnostics' },              -- LSP diagnostics
        },

        -- Right
        lualine_x = {
          { 'fileformat' }, -- unix/dos/mac
          { 'filetype' },   -- lua, js, etc
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
