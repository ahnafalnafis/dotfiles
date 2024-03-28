local telescope = require("telescope.builtin")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("LspAttach", {
  group = augroup("lsp_setup", { clear = true }),

  callback = function(event)
    -- A wrapper function to bind LSP key maps.
    ---@param lhs string
    ---@param rhs function|string
    ---@param desc string
    local function lsp_map(lhs, rhs, desc)
      nnoremap(lhs, rhs, {
        desc = desc,
        buffer = event.buf,
        silent = true,
      })
    end

    -- Go to mappings:
    lsp_map("g]", telescope.lsp_definitions, "Go to definitions")
    lsp_map("gd", vim.lsp.buf.declaration, "Go to declaration")
    lsp_map("gr", telescope.lsp_references, "Go to references")
    lsp_map("gI", telescope.lsp_implementations, "Go to implementations")
    lsp_map("gtd", telescope.lsp_type_definitions, "Go to type definitions")
    lsp_map("gs", telescope.lsp_document_symbols, "Go to document symbols")
    lsp_map("gws", telescope.lsp_workspace_symbols, "Go to workspace symbols")

    -- Code actions:
    lsp_map("gn", vim.lsp.buf.rename, "Rename current symbol")
    lsp_map("gca", vim.lsp.buf.code_action, "Code action")

    -- Hover documentation:
    lsp_map("K", vim.lsp.buf.hover, "Hover documentation")

    -- Diagnostics:
    lsp_map("gD", vim.diagnostic.open_float, "Code diagnostics")
    lsp_map("gwd", telescope.diagnostics, "Code diagnostics")
    lsp_map("d]", vim.diagnostic.goto_next, "Go to next diagnostic report")
    lsp_map("d[", vim.diagnostic.goto_prev, "Go to previous diagnostic report")
  end,
})
