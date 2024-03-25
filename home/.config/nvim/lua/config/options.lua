-- Enable line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- TODO: Send this to the plugins module
vim.opt.pumheight = 15

-- File backups.
vim.opt.undofile = true
vim.opt.swapfile = false

-- Search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clipboard.
vim.opt.clipboard:prepend("unnamedplus")

-- Splits.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Yeah, of course we can get rid of mouse while we're in NeoVim 8)
vim.opt.mouse = ""

-- Messages shown in the nice command line.
vim.opt.shortmess = "cfilnsxIT"

-- 80 character long lines. Break lines after that.
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.breakindent = true
-- vim.opt.wrap = false

vim.opt.updatetime = 50

vim.opt.nrformats = "alpha"

vim.opt.signcolumn = "yes"

vim.opt.formatoptions:remove("o")

-- stylua: ignore start
-- Indentation stuff
vim.opt.tabstop = 2          -- Tabs be 2 character wide
vim.opt.shiftwidth = 0       -- Follow the size of tabstop
vim.opt.smarttab = true      -- Inserts spaces when <Tab> is pressed
vim.opt.softtabstop = -1     -- Follow the size of shiftwidth
vim.opt.expandtab = true     -- Convert tabs into spaces
vim.opt.autoindent = true
vim.opt.copyindent = true
