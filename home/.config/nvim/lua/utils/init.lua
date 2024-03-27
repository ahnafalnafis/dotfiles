local this = {}

---@return nil
function this.add_line_above()
  vim.fn.append(vim.fn.line(".") - 1, "")
end

---@return nil
function this.add_line_below()
  vim.fn.append(vim.fn.line("."), "")
end

-- A `vim.fn.feedkeys()` wrapper.
---@param mode string
---@param key string
---@return nil
function this.feedkeys(mode, key)
  local term_code = vim.api.nvim_replace_termcodes(key, true, true, true)
  vim.api.nvim_feedkeys(term_code, mode, true)
end

-- A `vim.tbl_deep_extend()` wrapper.
---@param ... table
---@return table
function this.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

this.file_types = {
  asm = "Assembly",
  css = "CSS",
  html = "HTML",
  javascript = "JavaScript",
  javascriptreact = "JavaScript",
  json = "JSON",
  jsonc = "JSON with Comments",
  lua = "Lua",
  php = "PHP",
  scss = "S(CSS)",
  typescript = "TypeScript",
  typescriptreact = "TypeScript",
  vim = "Vim script",
}

function this.get_file_type(file_type)
  return this.file_types[file_type] or file_type
end

return this
