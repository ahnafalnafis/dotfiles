local highlight_yank =
  vim.api.nvim_create_augroup("highlight_yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = highlight_yank,
  callback = function()
    vim.highlight.on_yank()
  end,
})

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

---@type LazySpec
return {
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", opts = tree_sitter_options },
  { "folke/todo-comments.nvim", opts = {} },

  -- Color scheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,

    config = function()
      local gruvbox = require("gruvbox")

      ---@type GruvboxConfig
      local opts = {
        bold = false,
        italic = { strings = false },
        overrides = {
          SignColumn = { bg = gruvbox.palette.dark0 },
          DiagnosticSignError = { link = "GruvboxRed" },
          DiagnosticSignWarn = { link = "GruvboxYellow" },
          DiagnosticSignInfo = { link = "GruvboxBlue" },
          DiagnosticSignHint = { link = "GruvboxAqua" },
        },
      }

      gruvbox.setup(opts)
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
