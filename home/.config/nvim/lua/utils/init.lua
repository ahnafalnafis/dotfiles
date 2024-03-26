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

return this
