local utils = require("utils")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local completion_capabilities = cmp_nvim_lsp.default_capabilities() or {}

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
language_servers.jsonls = {}

-- local ensure_installed = {
--   "clangd",
--   "tsserver",
--   "svelte",
--   "bashls",
--   "lua_ls",
--   "yamlls",
--   "jsonls",
-- }

-- TODO: Need to configure following formatters and linters.
-- "cpplint",
-- "clang-format",
-- "prettier",
-- "shellcheck",
-- "stylua",
-- "markdownlint",

require("mason").setup()
require("mason-lspconfig").setup({
  handlers = {
    function(server)
      local server_options =
        utils.merge(language_servers[server] or {}, lsp_options)
      lspconfig[server].setup(server_options)
    end,
  },
})

vim.diagnostic.config({
  virtual_text = false,
})
