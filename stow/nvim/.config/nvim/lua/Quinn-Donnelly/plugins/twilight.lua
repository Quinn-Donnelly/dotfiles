return {
    "folke/twilight.nvim",
    opts = {
        treesitter = true,
        context = 20,
        expand = {   -- for treesitter, we we always try to expand to the top-most ancestor with these types
            "function",
            "if_statement",
            "method",
            "table",
        },
    }
}
