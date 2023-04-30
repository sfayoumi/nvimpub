------------------------------------------------------------------------------
--------------------------------WINDOW----------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>w", "<C-w>", { silent = true })
vim.keymap.set("n", "<leader>v", "<C-v>", { silent = true })

------------------------------------------------------------------------------
--------------------------------LSP-------------------------------------------
------------------------------------------------------------------------------
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "<A-r>", vim.lsp.buf.references, { noremap = true })
vim.keymap.set("n", "<A-f>", vim.lsp.buf.format, { noremap = true })
vim.keymap.set("n", "<A-h>", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set("i", "<A-h>", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set('n', '<A-s>', vim.lsp.buf.signature_help, { silent = true })

-- local holdGroup = vim.api.nvim_create_augroup("cursorGroup", {})
-- vim.api.nvim_create_autocmd(
--     "CursorMoved",
--     {
--         callback = vim.lsp.buf.clear_references,
--         group = holdGroup,
--     }
-- )
-- vim.api.nvim_create_autocmd(
--     "CursorHold",
--     {
--         callback = vim.lsp.buf.document_hithlight,
--         group = holdGroup,
--     }
-- )

------------------------------------------------------------------------------
--------------------------------TERMINAL--------------------------------------
------------------------------------------------------------------------------
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")

------------------------------------------------------------------------------
--------------------------------Window----------------------------------------
------------------------------------------------------------------------------
vim.keymap.set('n', '<Leader>ex', '<cmd>Exp<CR>', { silent = true })
vim.keymap.set('n', '<Leader>vex', '<cmd>Vex!<CR>', { silent = true })


