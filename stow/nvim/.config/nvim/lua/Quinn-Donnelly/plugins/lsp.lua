return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",

        -- neovim lsp configs
        "folke/neodev.nvim",

        -- snippets for completion
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- for git completion
        "petertriho/cmp-git",
        "nvim-lua/plenary.nvim", -- peer dependencies

        -- Tools for rust lsp
        "simrat39/rust-tools.nvim",
    },

    config = function()
        -- Completeions setup
        local cmp = require("cmp")
        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
        }
        -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            }, {
                { name = 'buffer' },
            })
        })
        -- git completion setup call
        require("cmp_git").setup()

        -- Language Servers Setup
        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local handlers = {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities
                }
            end,
            -- Next, you can provide targeted overrides for specific servers.
            ["rust_analyzer"] = function()
                require("rust-tools").setup {
                    capabilities = capabilities,
                }
            end,
            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
            end,
        }

        -- Mapping lsp keybindings when lsp is attached
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "gradle_ls",
                "groovyls",
                "dockerls",
                "bashls",
                "angularls",
                "typos_lsp",
                "eslint",
                "html",
                "jsonls",
                "tsserver",
                "marksman",
                "pyright",
                "terraformls",
            },
            handlers = handlers,
        })
    end
}
