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
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
    { 'rose-pine/neovim', name = 'rose-pine' },
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree" },
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
    {'ThePrimeagen/git-worktree.nvim'},
})
