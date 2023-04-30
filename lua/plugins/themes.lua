return {
    -- Misc vanity stuff
    'nvim-tree/nvim-web-devicons',

    -- Themes
    "ellisonleao/gruvbox.nvim",
    {
        "mcchrish/zenbones.nvim",
        dependencies = {
            "rktjmp/lush.nvim"
        }
    },
    'gruvbox-community/gruvbox',
    {
        'aktersnurra/no-clown-fiesta.nvim',
        config = function()
            require('no-clown-fiesta').setup({
                comments = "italic",
                type = "bold",
            })
        end
    },
}
