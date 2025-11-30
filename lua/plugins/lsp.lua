return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local buf = args.buf
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end

        -- Actions
        map("n", "<leader>lr", vim.lsp.buf.rename, "LSP Rename")
        map("n", "<leader>la", vim.lsp.buf.code_action, "Code action")

        -- Workspace
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace dir")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Rm workspace dir")

        -- Formatting
        map("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, "Format")
      end
    })

    vim.lsp.config['lua_ls'] = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end
}
