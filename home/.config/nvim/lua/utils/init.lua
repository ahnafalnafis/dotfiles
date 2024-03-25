local module = {}

function module.add_line_above()
  vim.fn.append(vim.fn.line(".") - 1, "")
end

function module.add_line_below()
  vim.fn.append(vim.fn.line("."), "")
end

return module
