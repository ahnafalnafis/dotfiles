---@type LazySpec
return {
  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      local bar_sign = "▌"

      require("gitsigns").setup({
        signs = {
          add = { text = bar_sign },
          change = { text = bar_sign },
          delete = { text = bar_sign },
          changedelete = { text = bar_sign },
          topdelete = { text = "‾" },
          untracked = { text = "┆" },
        },
      })
    end,
  },
}
