local wk = require("which-key")

local function map(mode, lhs, rhs, description)
  wk.add({{lhs, rhs, desc = description, mode = mode}})
  local options = { noremap = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "th", ":tabfirst<CR>", "go to first tab")
map("n", "tj", ":tabnext<CR>", "go to next tab")
map("n", "tk", ":tabprev<CR>", "go to previous tab")
map("n", "tl", ":tablast<CR>", "go to last tab")
map("n", "tt", ":tabedit<Space>", "edit tab name" )
map("n", "tn", ":tabnew<CR>", "open a new tab")
map("n", "tm", ":tabm<Space>", "move to the tab with given name")
map("n", "td", ":tabclose<CR>", "close the tab")
map("n", "<F5>", ":MundoToggle<CR>", "Toggle mundo window")
map("t", "<Esc>", "<C-\\><C-n>", "exit from terminal with <esc>")
