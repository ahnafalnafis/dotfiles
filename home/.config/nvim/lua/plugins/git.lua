return {
  "tpope/vim-fugitive",
  {
    "airblade/vim-gitgutter",

    init = function()
      local bar_sign = "▌"

      vim.g.gitgutter_sign_added = bar_sign
      vim.g.gitgutter_sign_removed = bar_sign
      vim.g.gitgutter_sign_modified = bar_sign
      vim.g.gitgutter_sign_modified_removed = bar_sign
    end
  }
}
