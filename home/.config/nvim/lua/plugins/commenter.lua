return {
  "tpope/vim-commentary",

  config = function()
    require("utils.mappers")

    nmap("<A-c>", "<Plug>CommentaryLine", { desc = "Comment out a line" })
    vmap("<A-c>", "<Plug>Commentary", { desc = "Comment out selected line(s)" })
  end,
}
