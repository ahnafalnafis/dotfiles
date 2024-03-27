local mappers = require("utils.mappers")

local nmap = mappers.nmap
local vmap = mappers.vmap

return {
  "tpope/vim-commentary",

  config = function()
    nmap("<A-c>", "<Plug>CommentaryLine", { desc = "Comment out a line" })
    vmap("<A-c>", "<Plug>Commentary", { desc = "Comment out selected line(s)" })
  end,
}
