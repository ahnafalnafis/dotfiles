return {
  "neovim/nvim-lspconfig",
  lazy = true,

  config = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
    require("plugins.lsp.keymaps")
  end,

  dependencies = {

    -- Lsp utils NeoVim
    -- TODO: Add Lspsaga.nvim
    { "folke/neodev.nvim", opts = {} },
  },
}
