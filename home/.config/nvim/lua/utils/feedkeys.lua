local function feedkeys(mode, key)
  local term_code = vim.api.nvim_replace_termcodes(key, true, true, true)
  vim.api.nvim_feedkeys(term_code, mode, true)
end

return {
  feedkeys = feedkeys
}
