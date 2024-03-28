local map = vim.keymap.set

---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts table|nil
local function noremap(mode, lhs, rhs, opts)
  opts = opts or {}
  map(mode, lhs, rhs, vim.tbl_extend("keep", { noremap = true }, opts))
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
_G.nmap = function(lhs, rhs, opts)
  map("n", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
_G.imap = function(lhs, rhs, opts)
  map("i", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
_G.vmap = function(lhs, rhs, opts)
  map("v", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
_G.nnoremap = function(lhs, rhs, opts)
  noremap("n", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
_G.inoremap = function(lhs, rhs, opts)
  noremap("i", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
_G.vnoremap = function(lhs, rhs, opts)
  noremap("v", lhs, rhs, opts)
end
