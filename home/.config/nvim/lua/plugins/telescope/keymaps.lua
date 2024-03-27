local builtin = require("telescope.builtin")

local mappers = require("utils.mappers")
local nnoremap = mappers.nnoremap

nnoremap("<Leader>f", builtin.find_files, { desc = "Find [F]iles" })
nnoremap("<Leader>b", builtin.buffers, { desc = "Find existing [B]uffers" })
