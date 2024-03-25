return {
  {
    -- The legendary language server configuration!
    {

      "neovim/nvim-lspconfig",
      config = function()
        require("plugins.lsp.config")
        require("plugins.lsp.completion")
        require("plugins.lsp.keymaps")
      end,

      dependencies = {
        -- Language server and tools managers.
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Auto completion.
        {
          "hrsh7th/nvim-cmp",
          dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
          },
        },

        -- Lsp utils NeoVim
        -- TODO: Add Lspsaga.nvim
        { "folke/neodev.nvim", opts = {} },

        -- Formatter
        {
          "stevearc/conform.nvim",
          opts = require("plugins.lsp.formatter").options,
        },
      },
    },
  },
}
