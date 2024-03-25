local tree_sitter_options = {
  ensure_installed = {
    "asm",
    "bash",
    "c",
    "cmake",
    "cpp",
    "html",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "regex",
    "sql",
    "tsx",
    "typescript",
    "yaml",
    -- "query",
  },
}

return {
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", opts = tree_sitter_options },
  { "folke/todo-comments.nvim", opts = {} },

  -- Color scheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,

    opts = {
      bold = false,
      italic = { strings = false },
    },

    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
