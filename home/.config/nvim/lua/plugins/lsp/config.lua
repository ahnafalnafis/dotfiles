local icons = require("utils.icons")
local utils = require("utils")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_config = require("lspconfig")

local language_server_capabilities = vim.lsp.protocol.make_client_capabilities()
local completion_capabilities = cmp_nvim_lsp.default_capabilities() or {}

---@type lspconfig.Config
local default_server_options = {
  capabilities = utils.merge(
    language_server_capabilities,
    completion_capabilities
  ),
}

-- LSP diagnostics configuration:
vim.diagnostic.config({ virtual_text = false })

local signs = {
  Error = icons.error,
  Warn = icons.warning,
  Hint = icons.circle,
  Info = icons.info,
}

for sign_type, icon in pairs(signs) do
  local group = "DiagnosticSign" .. sign_type
  vim.fn.sign_define(group, { text = icon, texthl = group, numhl = group })
end

-- Mason configuration:
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
})

require("mason-lspconfig").setup_handlers({
  ---@param server_name string
  function(server_name)
    -- Each sub modules of plugins/lsp/servers returns a table which
    -- contains options for respective server.
    ---@type table
    local server_options = require("plugins.lsp.servers." .. server_name)
    server_options = utils.merge(default_server_options, server_options or {})

    lsp_config[server_name].setup(server_options)
  end,
})

require("mason-tool-installer").setup({
  ensure_installed = {
    -- Language servers
    "clangd",
    "tsserver",
    "pyright",
    "lua_ls",
    "bashls",
    "jsonls",
    "yamlls",

    -- Linters
    "cpplint",
    "eslint",
    "markdownlint",
    "shellcheck",

    -- Formatters
    "clang-format",
    "prettierd",
    "autopep8",
    "stylua",
  },
})
