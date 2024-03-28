---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      require("plugins.lsp.config")
      require("plugins.lsp.keymaps")
      require("plugins.lsp.completion")
    end,

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "b0o/SchemaStore.nvim",
      "folke/neodev.nvim",

      -- Auto completion
      {
        "hrsh7th/nvim-cmp",

        dependencies = {
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-vsnip",
          "hrsh7th/vim-vsnip",
        },
      },
    },
  },
}
