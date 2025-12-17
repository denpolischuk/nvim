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

    local on_attach = function(client, bufnr)
      -- Enable format on save only if supported
      if client.supports_method("textDocument/formatting") then
        local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

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

    vim.lsp.config['gopls'] = {
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    }

    vim.lsp.config['terraformls'] = {
      on_attach = on_attach,
    }
  end
}
