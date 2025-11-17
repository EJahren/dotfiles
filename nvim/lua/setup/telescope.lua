local wk = require("which-key")

local function map(mode, lhs, rhs, description)
  wk.add({
    {lhs, rhs, desc=description},
  })
  local options = { noremap = true, desc=description}
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep with telescope")
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files with telescope")
