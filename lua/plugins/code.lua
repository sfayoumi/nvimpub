return {

    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end
    },
    'windwp/nvim-ts-autotag',

    {
        'kylechui/nvim-surround',
--         config = function()
--             require('nvim-surround').setup()
--         end
    },
    {
        'tpope/vim-fugitive',
        keys = {
            { '<Leader>g', ':G<CR>', silent = true }
        },
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Brackets and tags
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end
    },
    'windwp/nvim-ts-autotag',
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
}
