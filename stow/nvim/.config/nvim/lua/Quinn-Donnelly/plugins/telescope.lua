return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    keys = {
        { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<C-p>",      "<cmd>Telescope git_files<cr>",  desc = "find files checked into git" },
        { "<leader>ps", "<cmd>Telescope live_grep<cr>",  desc = "grep for pattern" },
        { "<leader>ph", "<cmd>Telescope help_tags<cr>",  desc = "search help" },
    },

    config = function()
        require("telescope").setup {
            pickers = {
                live_grep = {
                    additional_args = function(opts)
                        return { "--hidden" }
                    end
                },
            },
        }
    end
}
