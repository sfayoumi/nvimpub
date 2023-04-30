return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    "lua",
                    "go",
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "python",
                    -- "dart",
                    -- "json",
                    -- "yaml",
                    -- "toml",
                    -- "bash",
                    -- "rust",
                    -- "svelte",
                    -- "regex",
                    -- "sql",
                },
                sync_install = true,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                autotag = {
                    enable = true
                }
            })
        end
    },
    'nvim-treesitter/playground',
}
