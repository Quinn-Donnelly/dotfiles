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
    "nvim-telescope/telescope.nvim"
  },
  keys = {
    { "<leader>ot", "<cmd>ObsidianToday<cr>",       desc = "Open todays notes in obsidian" },
    { "<leader>on", "<cmd>ObsidianNew<cr>",         desc = "Open new note in obsidian" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>",      desc = "Searches for file in obsidian open, create, insert" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Searches by file name across the vault" },
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
      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },
      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
      },
      disable_frontmatter = true,
      notes_subdir = "_Add",
      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        print("testing...")
        return title
      end,
      note_frontmatter_func = function()
        return {}
      end,
    })

    vim.conceallevel = 1
  end
}
