return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		-- LazyVim config for treesitter
		indent = { enable = true }, ---@type lazyvim.TSFeat
		highlight = { enable = true }, ---@type lazyvim.TSFeat
		folds = { enable = true }, ---@type lazyvim.TSFeat
		ensure_installed = {
			"bash",
			"diff",
			"json",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
