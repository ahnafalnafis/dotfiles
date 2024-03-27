local cmp = require("cmp")
local helpers = require("plugins.lsp.helpers")
local icons = require("utils.icons")

-- TODO: Also set pop up menu width
vim.opt.pumheight = 15

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    fields = { "kind", "abbr" },

    format = function(_, item)
      item.kind = icons.lsp_kinds[item.kind] or ""
      return item
    end,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  }),

  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),

    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<Tab>"] = cmp.mapping(helpers.on_tab, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(helpers.on_shift_tab, { "i", "s" }),
  }),
})
