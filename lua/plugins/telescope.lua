return {
    'nvim-lua/plenary.nvim',
    -- 'nvim-lua/popup.nvim',
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
        event = "VeryLazy",
        keys = function()
            return {
                -- add a keymap to browse plugin files
                -- stylua: ignore
                {
                    "<leader>ff",
                    "require('telescope.builtin').find_files()",
                    desc = "Find File",
                },
                {
                    '<Leader>t',
                    '<cmd>Telescope<CR>',
                    silent = true
                },
                { '<Leader>tp', '<cmd>Telescope projects<CR>',   silent = true },
                {
                    '<Leader>tb',
                    '<cmd>lua require("telescope.builtin").buffers({sort_mru=true})<CR>',
                    silent = true,
                },
                {
                    '<Leader>tf',
                    '<cmd>Telescope flutter<CR>',
                    silent = true
                },
                -- vim.keymap.set('n', '<Leader>f', '<cmd>Telescope find_files<CR>', {silent=true})
                {
                    '<Leader>fo',
                    '<cmd>Telescope oldfiles<CR>',
                    silent = true
                },
                { '<Leader>ff', '<cmd>Telescope find_files<CR>', silent = true },
                { '<Leader>fg', '<cmd>Telescope live_grep<CR>',  silent = true },
                {
                    '<Leader>fb',
                    "lua require('telescope.builtin').buffers({ sort_mru = true })",
                    silent = true
                },
                { '<Leader>fh', '<cmd>Telescope help_tags<CR>',               silent = true },
                { '<Leader>fp', '<cmd>Telescope projects<CR>',                silent = true },
                { '<Leader>tr', '<cmd>Telescope file_browser path=%:p:h<CR>', silent = true },
            }
        end,
        -- change some options
        opts = {
            defaults = {},
        },
        config = function()
            -- require('telescope').load_extension('projects')
            require('telescope').load_extension('file_browser')
            require('telescope').setup({
                extensions = {
                    -- file_browser = {
                    --     path = "%:p:h",
                    -- }
                }
            })
        end
    },
}
