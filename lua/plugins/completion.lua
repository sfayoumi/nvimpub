-- TODO: line diagnostics keymap
-- TODO: show references keymap
-- TODO: peek definition keymap
-- TODO:

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {}
    ),
    ["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {}
    ),
}

return {
    -- The completion UI engine, requires sources (LSP, snippets, etc)
    {
        "hrsh7th/nvim-cmp",
        event = 'BufEnter',
        config = function()
            -- Setup nvim-cmp.
            local lspkind = require('lspkind')
            local cmp = require 'cmp'

            cmp.setup({
                preselect = cmp.PreselectMode.None,
                completion = {
                    keyword_length = 1,
                    get_trigger_characters = function(trigger_characters)
                        local new_trigger_characters = {}
                        for _, char in ipairs(trigger_characters) do
                            if char ~= '>' then
                                table.insert(new_trigger_characters, char)
                            end
                        end
                        return new_trigger_characters
                    end
                },
                performance = {
                    fetching_timeout = 100,
                    debounce = 200,
                    throttle = 30,
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                view = {
                    entries = {
                        name = 'custom',
                        separator = '|',
                        selection_order = 'near_cursor'
                    }
                },
                formatting = {
                    format = lspkind.cmp_format {
                        with_text = true,
                        menu = {
                            buffer = "[buf]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[api]",
                            path = "[path]",
                            luasnip = "[snip]"
                        }
                    }
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end,
        dependencies = {
            -- Completion with words in the current buffer
            "hrsh7th/cmp-buffer",
            -- Completion for the command line
            "hrsh7th/cmp-cmdline",
            -- completion source for the Neovim Lua API
            "hrsh7th/cmp-nvim-lua",
            -- Symbols in completions
            "onsails/lspkind-nvim",

            -- Snippets
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',

            -- lsp source
            {
                "hrsh7th/cmp-nvim-lsp",
                dependencies = {
                    -- Configs for lsp
                    "neovim/nvim-lspconfig",
                },
                config = function()
                    -- Setup lspconfig.
                    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
                    .make_client_capabilities())
                    local lsp_servers = {
                        "gopls",
                        "lua_ls",
                        "eslint",
                        "svelte",
                        "tsserver",
                        "jsonls",
                        "cssls",
                        "tailwindcss",
                        "bashls",
                        "sqlls",
                        "html",
                        "pyright",
                        "theme_check",
                    }
                    local lsp_config = require('lspconfig')

                    for _, v in ipairs(lsp_servers) do
                        local conf = {
                            capabilities = capabilities,
                            handlers = handlers,
                        }
                        if v == "gopls" then
                            conf['cmd'] = { "gopls", "serve" }
                            conf['settings'] = {
                                gopls = {
                                    analyses = {
                                        unusedparams = true,
                                    },
                                    staticcheck = true,
                                },
                            }
                        end
                        if v == "lua_ls" then
                            conf['settings'] = {
                                Lua = {
                                    completion = {
                                        keywordSnippet = "Disable",
                                    },
                                    runtime = {
                                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                        version = "LuaJIT",
                                        -- Setup your lua path
                                        path = vim.split(package.path, ";")
                                    },
                                    diagnostics = {
                                        -- Get the language server to recognize the `vim` global
                                        enable = true,
                                        globals = { 'vim' },
                                        -- disable = { "lowercase-global" }
                                    },
                                    workspace = {
                                        -- Make the server aware of Neovim runtime files
                                        library = vim.api.nvim_get_runtime_file("", true),
                                        -- library = {
                                        --     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        --     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                        -- },
                                    },
                                },
                            }
                        end
                        lsp_config[v].setup(conf)
                    end
                end,
            },
        }
    },
}
