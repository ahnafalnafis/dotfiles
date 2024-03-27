local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_path_exists = vim.loop.fs_stat(lazy_path)

-- Bootstrapping lazy:
if not lazy_path_exists then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

-- Plugins:
require("lazy").setup({
  spec = { import = "plugins" },

  install = {
    colorschme = { "gruvbox", "habamax" },
  },

  change_detection = {
    notify = false,
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "gzip",
        "netrw",
        "netrwPlugin",
        "spellfile_plugin",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
