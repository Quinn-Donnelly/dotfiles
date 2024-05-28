return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    keys         = {
        { "<leader>tt", "<Cmd>TestNearest<CR>", desc = "Runs the nearest test in a new tmux pane" },
        { "<leader>ts", "<Cmd>TestSuite<CR>",   desc = "Runs the test suite" },
        { "<leader>tf", "<Cmd>TestFile<CR>",    desc = "Runs the files for tests" },
        { "<leader>tl", "<Cmd>TestLast<CR>",    desc = "Runs the last test run" },
        { "<leader>tv", "<Cmd>TestVisit<CR>",   desc = "Jumps to the test file you last ran tests from" },
    },
    config       = function()
        vim.cmd("let test#strategy = 'vimux'")
    end
}
