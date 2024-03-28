local builtin = require("telescope.builtin")

nnoremap("<Leader>f", builtin.find_files, { desc = "Find [F]iles" })
nnoremap("<Leader>b", builtin.buffers, { desc = "Find existing [B]uffers" })
nnoremap("<Leader>k", builtin.keymaps, { desc = "Find [K]eymaps" })
