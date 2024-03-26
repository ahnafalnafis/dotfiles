local utils = require("utils")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local completion_capabilities = cmp_nvim_lsp.default_capabilities() or {}

---@type lspconfig.Config
local lsp_options = {
  capabilities = utils.merge(capabilities, completion_capabilities),
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    handlers = {
      ---@param server_name string
      function(server_name)
        -- Each sub modules of plugins/lsp/servers returns a table which
        -- contains options for respective server.
        ---@type table
        local server_options = require("plugins.lsp.servers." .. server_name)

        server_options = utils.merge(lsp_options, server_options or {})

        lspconfig[server_name].setup(server_options)
      end,
    },
  },

  ---@type LazySpec[]
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      ---@type MasonLspconfigSettings
      opts = {
        ensure_installed = {
          "bashls",
          "clang-format",
          "clangd",
          "cpplint",
          "eslint",
          "jsonls",
          "lua_ls",
          "markdownlint",
          "prettier",
          "shellcheck",
          "stylua",
          "tsserver",
          "yamlls",
        },
      },
    },
  },
}
