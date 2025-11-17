-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local wk = require("which-key")

   local function buf_set_keymap(mode, lhs, rhs, description)
     wk.register(mode, {
       [lhs] = {rhs, description},
     })
     vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap=true, silent=true })
   end
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts =

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', "go to declaration")
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', "go to definiton")
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', "hover info")
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', "go to implementation")
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder")
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Rename workspace folder")
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "list workspace folders")
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', "rename symbol")
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', "Go to reference")
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', "Open error in floating window")
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go to next error")
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', "Go to previous error")
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', "reformat")
  buf_set_keymap('n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>', "Perform code action")
  buf_set_keymap('v', '<leader>af', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', "Perform code action")

end

local servers = { 'pyright', 'clangd' }
for _, lsp in ipairs(servers) do
    vim.lsp.config[lsp] = {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
