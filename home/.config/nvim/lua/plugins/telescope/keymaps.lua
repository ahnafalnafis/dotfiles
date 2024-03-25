local builtin = require("telescope.builtin")
local telescope = require("telescope")
local themes = require("telescope.themes")

local mappers = require("utils.mappers")
local nnoremap = mappers.nnoremap

telescope.setup({
  extensions = {
    ["ui-select"] = { themes.get_dropdown() },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

nnoremap("<Leader>f", builtin.find_files, { desc = "Find [F]iles" })
nnoremap("<Leader>b", builtin.buffers, { desc = "Find existing [B]uffers" })
