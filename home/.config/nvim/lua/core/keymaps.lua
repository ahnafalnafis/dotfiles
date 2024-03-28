require("utils.mappers")

-- The legend key ;)
vim.g.mapleader = ";"

nnoremap("<A-a>", "msggVG", { desc = "Select all" })

vnoremap("<", "<gv", { desc = "Restore visual mode after a visual shifting" })
vnoremap(">", ">gv", { desc = "Restore visual mode after a visual shifting" })

nnoremap("<C-k>", function()
  vim.fn.append(vim.fn.line(".") - 1, "")
end, {
  silent = true,
  desc = "Add an empty line above",
})

nnoremap("<C-j>", function()
  vim.fn.append(vim.fn.line("."), "")
end, {
  silent = true,
  desc = "Add an empty line below",
})

nnoremap("<A-k>", "<Cmd>move . -2<CR>", { desc = "Move current line up" })
vnoremap("<A-k>", ":move '< -2<CR>gv", { desc = "Move current line up" })
nnoremap("<A-j>", "<Cmd>move . +1<CR>", { desc = "Move current line down" })
vnoremap("<A-j>", ":move '> +1<CR>gv", { desc = "Move current line down" })

nnoremap("<Leader>d", "<Cmd>bdelete<CR>", { desc = "Delete current buffer" })
nnoremap("<Tab>", "<Cmd>bnext<CR>", { desc = "Go to the next buffer" })
nnoremap("<S-Tab>", "<Cmd>bprevious<CR>", {
  desc = "Go to the previous buffer",
})

nnoremap("<PageUp>", "<Cmd>tabnext<CR>", { desc = "Go to the next tab page" })
nnoremap("<PageDown>", "<Cmd>tabprevious<CR>", {
  desc = "Go to the previous tab page",
})

nnoremap("0", "^")
nnoremap("k", "gk")
nnoremap("j", "gj")
nnoremap("gk", "k")
nnoremap("gj", "j")

nnoremap("<C-u>", "<C-u>zz", { desc = "Scroll up" })
nnoremap("<C-d>", "<C-d>zz", { desc = "Scroll down" })

nnoremap("n", "nzz", { desc = "Go to the next search" })
nnoremap("N", "Nzz", { desc = "Go to the previous search" })
nnoremap("*", "*zzzv", {
  desc = "Go to the next search that matches current word",
})
nnoremap("#", "#zzzv", {
  desc = "Go to the previous search that matches current word",
})

nnoremap("Q", "@q", { desc = "Apply macros" })
