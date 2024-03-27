local opt = vim.opt

-- Enable line numbers.
opt.number = true
opt.relativenumber = true

-- File backups.
opt.undofile = true
opt.swapfile = false

-- Search.
opt.ignorecase = true
opt.smartcase = true

-- Clipboard.
opt.clipboard = "unnamedplus"

-- Splits.
opt.splitright = true
opt.splitbelow = true

-- Yeah, of course we can get rid of mouse while we're in NeoVim 8)
opt.mouse = ""

-- Messages shown in the nice command line.
opt.shortmess = "cfilnsxIT"

-- 80 character long lines. Break lines after that.
opt.textwidth = 80
opt.linebreak = true
opt.breakindent = true
opt.breakindent = true
-- opt.wrap = false

-- Misc
opt.updatetime = 500
opt.nrformats = "alpha"
opt.signcolumn = "yes"
opt.formatoptions:remove("o")
opt.fillchars:append(",eob: ")

-- stylua: ignore start
-- Indentation stuff
opt.tabstop = 2          -- Tabs be 2 character wide
opt.shiftwidth = 0       -- Follow the size of tabstop
opt.smarttab = true      -- Inserts spaces when <Tab> is pressed
opt.softtabstop = -1     -- Follow the size of shiftwidth
opt.expandtab = true     -- Convert tabs into spaces
opt.autoindent = true
opt.copyindent = true
