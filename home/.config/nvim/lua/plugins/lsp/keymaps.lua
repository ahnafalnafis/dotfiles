local builtin = require("telescope.builtin")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local mappers = require("utils.mappers")
local nnoremap = mappers.nnoremap

autocmd("LspAttach", {
  group = augroup("lsp-setup", { clear = true }),

  callback = function(event)
    local function buf_map(lhs, rhs, desc)
      nnoremap(lhs, rhs, {
        desc = desc,
        buffer = event.buf,
        silent = true,
      })
    end

    buf_map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
    buf_map("gr", builtin.lsp_references, "[G]oto [R]eferences")
    buf_map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

    buf_map("gD", vim.lsp.buf.declaration, "[G]oto [D]efinition")

    buf_map(
      "<Leader>td",
      builtin.lsp_type_definitions,
      "Goto [T]ype [D]efinition"
    )

    buf_map("<Leader>s", builtin.lsp_document_symbols, "Document [S]ymbols")

    buf_map(
      "<Leader>ws",
      builtin.lsp_workspace_symbols,
      "[W]orkspace [S]ymbols"
    )

    buf_map("<Leader>r", vim.lsp.buf.rename, "[R]ename current symbol")

    buf_map("<Leader>ca", vim.lsp.buf.code_action, "[C]ode [a]ction")
    buf_map("K", vim.lsp.buf.hover, "Hover documentation")
  end,
})
