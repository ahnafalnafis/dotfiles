---@type LazySpec
return {
  {
    "NeogitOrg/neogit",

    config = function()
      local neogit = require("neogit")
      neogit.setup({})

      nnoremap("<Leader>gg", neogit.open, {
        desc = "Open Neogit in new tab",
      })

      nnoremap("<Leader>gv", function()
        neogit.open({ kind = "vsplit" })
      end, {
        desc = "Open Neogit in new vertical split",
      })

      nnoremap("<Leader>gs", function()
        neogit.open({ kind = "split" })
      end, {
        desc = "Open Neogit in new split",
      })

      nnoremap("<Leader>gr", function()
        neogit.open({ kind = "replace" })
      end, {
        desc = "Open Neogit in current window",
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      local bar_sign = "▌"

      require("gitsigns").setup({
        signs = {
          add = { text = bar_sign },
          change = { text = bar_sign },
          delete = { text = bar_sign },
          changedelete = { text = bar_sign },
          topdelete = { text = "‾" },
          untracked = { text = "┆" },
        },
      })
    end,
  },
}
