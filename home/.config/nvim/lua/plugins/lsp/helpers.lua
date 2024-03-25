local module = {}

local cmp = require("cmp")
local feedkeys = require("utils.feedkeys")

module.on_tab = function(fallback)
  local is_snippet_available = vim.fn["vsnip#available"](1) == 1

  if cmp.visible() then
    cmp.select_next_item()

  elseif is_snippet_available then
    feedkeys("<Plug>(vsnip-expand-or-jump)", "")

  else
    fallback()
  end
end

module.on_shift_tab = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()

  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    feedkeys("<Plug>(vsnip-jump-prev)", "")

  else
    fallback()
  end
end

module.on_enter = function (fallback)
  if cmp.visible() then
    cmp.mapping.confirm()
  else
    fallback()
  end
end

return module

