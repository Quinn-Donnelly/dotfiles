return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	keys = {
		{ "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "find files" },
		{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "find files checked into git" },
		{ "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "grep for pattern" },
	},

	config = function()
	end
}
