return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "gofmt" },
				python = { "pyink" },
				json = { "jq" },
				jsonc = { "jq" },
				lua = { "stylua" },
				markdown = { "prettier" },
				yaml = { "yq" },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
