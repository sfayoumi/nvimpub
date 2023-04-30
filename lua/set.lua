vim.g.material_style = "deep ocean"
vim.g.zenbones = { darkness = "stark", lightness = "dim" }
vim.g.zenwritten = { darkness = "stark", lightness = "dim" }
vim.g.neobones = { darkness = "stark", lightness = "dim" }


vim.cmd [[colorscheme zenbones]]
-- vim.cmd [[colorscheme rose-pine]]
-- vim.cmd [[colorscheme nord]]
-- vim.cmd [[colorscheme github_dark_default]]
-- vim.cmd[[colorscheme meh]]
-- vim.cmd[[colorscheme base16-github]]
-- vim.cmd[[colorscheme rose-pine]]
-- vim.cmd[[colorscheme no-clown-fiesta]]
-- vim.cmd[[colorscheme material]]
-- vim.cmd [[colorscheme nightfox]]
--

-- vim.g.netrw_liststyle = 3

vim.opt.guicursor = "a:block-blinkon300blinkoff300,i-ci:ver30-iCursor-blinkwait300-blinkon300-blinkoff300"
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h12"
-- vim.opt.guifont = "FiraCode Nerd Font:h12"
-- vim.opt.guifont = "RobotoMono Nerd Font:h12"

-- Fold using treesitter syntax
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 3
vim.opt.foldenable = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.splitright = true

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "100"

vim.opt.termguicolors = true

-- vim.g.python3_host_prog='python'

-- local win = require('lspconfig.ui.windows')
-- local _default_opts = win.default_opts

-- win.default_opts = function(options)
--     local opts = _default_opts(options)
--     -- opts.border = 'single'
--     opts.border = 'none'
--     return opts
-- end
