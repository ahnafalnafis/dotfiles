local this = {}

function this.add_line_above()
  vim.fn.append(vim.fn.line(".") - 1, "")
end

function this.add_line_below()
  vim.fn.append(vim.fn.line("."), "")
end

function this.feedkeys(mode, key)
  local term_code = vim.api.nvim_replace_termcodes(key, true, true, true)
  vim.api.nvim_feedkeys(term_code, mode, true)
end

function this.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

return this
