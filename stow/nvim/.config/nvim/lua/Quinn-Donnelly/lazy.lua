local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("Quinn-Donnelly.telescope"),
    require("Quinn-Donnelly.treesitter"),
    { 'nvim-lua/plenary.nvim' },
    { "ellisonleao/gruvbox.nvim",         priority = 1000,   config = true },
    { 'rose-pine/neovim',                 name = 'rose-pine' },
    { "ThePrimeagen/harpoon" },
    { "mbbill/undotree" },
    { 'L3MON4D3/LuaSnip' },
    { 'ThePrimeagen/git-worktree.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui' },
    { 'mfussenegger/nvim-lint' },
    { 'mhartington/formatter.nvim' },
    { 'simrat39/rust-tools.nvim' },
    { "folke/neodev.nvim",                opts = {} }, -- fixes undefined global vim and nvim sig help
})
