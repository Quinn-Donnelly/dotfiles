autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=300}
lua require("init")
