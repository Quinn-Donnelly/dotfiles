return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    keys = {
        { "<leader>t", "<cmd>ObsidianToday<cr>", desc = "Open todays notes in obsidian" },
        { "<leader>n", "<cmd>ObsidianNew<cr>", desc = "Open new note in obsidian" },
    },
    opts = {
        workspaces = {
            {
                name = "vault",
                path = "~/Documents/projects/vault",
            },
        },

        -- see below for full list of options 👇
    },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "vault",
                    path = "~/Documents/projects/vault",
                },
            },
            ui = {
                enable = false,
            },
            daily_notes = {
                folder = "Calendar/Daily Notes"
            },
            notes_subdir = "_Add",
            completion = {
                new_notes_location = "notes_subdir",
                prepend_note_id = false,
                prepend_note_path = false,
                use_path_only = true,
            },
            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                print("testing...")
                return title
            end,
        })

        vim.conceallevel = 1
    end
}
