return {
	"2kabhishek/seeker.nvim",
	dependencies = { "folke/snacks.nvim" },
	cmd = { "Seeker" },
	keys = {
		{ "<leader>Sf", ":Seeker files<CR>", desc = "Seek Files" },
		{ "<leader>Sg", ":Seeker git_files<CR>", desc = "Seek Git Files" },
		{ "<leader>Ss", ":Seeker grep<CR>", desc = "Seek Grep" },
		{ "<leader>Sw", ":Seeker grep_word<CR>", desc = "Seek Grep Word" },
	},
	opts = {},
}
