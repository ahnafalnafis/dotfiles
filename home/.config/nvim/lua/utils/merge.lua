local module = {}

function module.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

return module
