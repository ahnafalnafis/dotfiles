local map = vim.keymap.set

local function noremap(mode, lhs, rhs, opts)
  opts = opts or {}
  map(mode, lhs, rhs, vim.tbl_extend("keep", { noremap = true }, opts))
end

return {
  nmap     = function(...)     map("n", ...) end,
  imap     = function(...)     map("i", ...) end,
  vmap     = function(...)     map("v", ...) end,
  smap     = function(...)     map("s", ...) end,
  nnoremap = function(...) noremap("n", ...) end,
  inoremap = function(...) noremap("i", ...) end,
  vnoremap = function(...) noremap("v", ...) end,
  snoremap = function(...) noremap("s", ...) end,
}
