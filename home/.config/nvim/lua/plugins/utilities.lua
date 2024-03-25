-- This plugin sub module contains utility plugins.

local mappers = require("utils.mappers")

local nmap = mappers.nmap
local vmap = mappers.vmap

return {
  {
    "tpope/vim-commentary",
    config = function()
      nmap("<A-c>", "<Plug>CommentaryLine", { desc = "Comment out a line" })
      vmap(
        "<A-c>",
        "<Plug>Commentary",
        { desc = "Comment out selected line(s)" }
      )
    end,
  },

  "cohama/lexima.vim",

  { "mbbill/undotree", cmd = "UndotreeToggle" },

  -- TODO: Configure folke/noice.nvim
  "rcarriga/nvim-notify",
}
