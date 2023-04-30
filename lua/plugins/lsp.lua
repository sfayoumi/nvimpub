return {
    -- Go
    {
        'ray-x/go.nvim',
        dependencies = {  -- optional packages
            -- Floating windows for go.nvim
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
          require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
    },

    "folke/neodev.nvim",
    'evanleck/vim-svelte',
    'jmcantrell/vim-virtualenv',
    'iamcco/markdown-preview.nvim',

    {
        "williamboman/mason.nvim",
        config = function() 
            -- vim.cmd [[ MasonUpdate ]]
            require("mason").setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "eslint",
                    "tsserver"
                },
                automatic_installation = true
            })
        end,
        dependencies = {
            'williamboman/mason.nvim'
        }
    },

}
