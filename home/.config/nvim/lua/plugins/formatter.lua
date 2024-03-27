return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    notify_on_error = false,

    format_on_save = function()
      return { timeout_ms = 5000 }
    end,

    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang_format" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      markdown = { "prettierd" },
    },
  },
}
