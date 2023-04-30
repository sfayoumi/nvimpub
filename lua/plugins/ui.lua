return {
    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup({})
        end
    },
    {
        'hoob3rt/lualine.nvim',
        config = function()
            require("lualine").setup()
        end
    },

    -- {
    --     'stevearc/aerial.nvim/',
    --     -- keys = {
    --     --     {
    --     --         '<Leader>s', ':AerialToggle!<CR>', silent = true
    --     --     },
    --     -- },
    --     config = function()
    --         require('aerial').setup({
    --             -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    --             on_attach = function(bufnr)
    --                 -- Jump forwards/backwards with '{' and '}'
    --                 vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    --                 vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    --             end
    --         })
    --     end
    -- },
    {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        })
      end,
    },

    {
        'akinsho/bufferline.nvim',
        event = 'BufEnter',
        keys = {

            -- Move to previous/next
            { '<A-,>',     ':BufferLineCyclePrev<CR>',      silent = true },
            { '<A-.>',     ':BufferLineCycleNext<CR>',      silent = true },
            -- { '<A-,>', ':bp<CR>', silent = true }
            -- { '<A-.>', ':bn<CR>', silent = true }

            -- Re-order to previous/next
            { '<A-<>',     ':BufferLineMovePrev<CR>',       silent = true },
            { '<A->>',     ':BufferLineMoveNext<CR>',       silent = true },

            -- Goto buffer in position...
            { '<A-1>',     ':BufferGoto 1<CR>',             silent = true },
            { '<A-2>',     ':BufferGoto 2<CR>',             silent = true },
            { '<A-3>',     ':BufferGoto 3<CR>',             silent = true },
            { '<A-4>',     ':BufferGoto 4<CR>',             silent = true },
            { '<A-5>',     ':BufferGoto 5<CR>',             silent = true },
            { '<A-6>',     ':BufferGoto 6<CR>',             silent = true },
            { '<A-7>',     ':BufferGoto 7<CR>',             silent = true },
            { '<A-8>',     ':BufferGoto 8<CR>',             silent = true },
            { '<A-9>',     ':BufferLast<CR>',               silent = true },

            --     " Pin/unpin buffer
            { '<A-p>',     ':BufferPin<CR>' },
            --     " Close buffer
            -- {  '<A-w>', '<cmd>bdel <bar>bp<CR>' }
            -- {  '<A-w>', '<cmd>bp <bar> bdel #<CR>' }
            { '<A-w>',     '<cmd>Bdelete<CR>' },

            --
            --     " Wipeout buffer
            --     "                          :BufferWipeout<CR>
            --     " Close commands
            --     "                          :BufferCloseAllButCurrent<CR>
            --     "                          :BufferCloseAllButPinned<CR>
            --     "                          :BufferCloseAllButCurrentOrPinned<CR>
            --     "                          :BufferCloseBuffersLeft<CR>
            --     "                          :BufferCloseBuffersRight<CR>
            --
            --     " Magic buffer-picking mode
            { '<C-s>',     ':BufferLinePick<CR>' },

            --     " Sort automatically by...
            { '<Space>bb', ':BufferOrderByBufferNumber<CR>' },
            { '<Space>bd', ':BufferOrderByDirectory<CR>' },
            { '<Space>bl', ':BufferOrderByLanguage<CR>' },
            { '<Space>bw', ':BufferOrderByWindowNumber<CR>' },
        },
        config = function()
            local opts = {
                show_buffer_close_icons = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true
                    }
                },
                indicator = {
                    style = 'underline'
                },
            }
            require('bufferline').setup({ options = opts })
        end
    },
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require("toggleterm").setup({
                open_mapping = "<A-t>"
            })
        end
    }
}
