return {
  "nvim-telescope/telescope.nvim",

  event = "VimEnter",
  branch = "0.1.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
    },
  },

  config = function()
    require("plugins.telescope.config")
    require("plugins.telescope.keymaps")
  end,
}
