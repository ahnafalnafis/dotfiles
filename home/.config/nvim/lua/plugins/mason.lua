local utils = require("utils")

-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local completion_capabilities = cmp_nvim_lsp.default_capabilities() or {}
local completion_capabilities = {}

local language_servers = {}
local lsp_options = {
  capabilities = utils.merge(capabilities, completion_capabilities),
}

language_servers.clangd = {}
language_servers.tsserver = {}
language_servers.eslint = {}
language_servers.emmet_ls = {}
language_servers.svelte = {}
language_servers.lua_ls = {}
language_servers.bashls = {}
language_servers.yamlls = {}

language_servers.jsonls = {
  json = {
    schemas = {
      {
        fileMatch = { "package.json" },
        url = "https://json.schemastore.org/package.json",
      },
      {
        fileMatch = { "tsconfig*.json" },
        url = "https://json.schemastore.org/tsconfig.json",
      },
    },
  },
}

return {

  "williamboman/mason-lspconfig.nvim",
  opts = {
    handlers = {
      function(server)
        local server_options =
          utils.merge(lsp_options, language_servers[server] or {})

        lspconfig[server].setup(server_options)
      end,
    },
  },

  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
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
          "svelte",
          "tsserver",
          "yamlls",
        },
      },
    },
  },
}
