local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

return require("lazy").setup({
    {
      "nvim-treesitter/nvim-treesitter",
      config = function() require("setup/treesitter") end,
      build = ":TSUpdate",
    },
    { "neovim/nvim-lspconfig", config = function() require("setup/lsp") end },
    { "simnalamburt/vim-mundo", version = "v3.0.1" },
    { "vim-airline/vim-airline",
        config = function () require("setup/vim-airline") end,
        dependencies = { "vim-airline/vim-airline-themes" },
        version = "v0.11"
    },
    { "vim-airline/vim-airline-themes" },
    { "tpope/vim-vinegar" },
    { "tpope/vim-fugitive" },
    {
        "vimwiki/vimwiki",
        config = function () require("setup/vim-wiki") end,
        version="v2023.04.04_1"
    },
    {
        "vim-test/vim-test",
        setup = function () require("setup/vim-test") end
    },
    { "psf/black" },
    { "lervag/vimtex",
      config = function() require("setup/vimtex") end
    },
    {
       "hrsh7th/nvim-cmp",
       dependencies = {
         { "onsails/lspkind-nvim", module = "lspkind" },
         { "hrsh7th/cmp-buffer", module = "cmp_buffer" },
         { "hrsh7th/cmp-path", module = "cmp_path" },
         { "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
         { "hrsh7th/cmp-nvim-lua", module = "cmp_nvim_lua" },
       },
       event = "InsertEnter",
       config = function()
         require "setup/cmp"
       end,
    },
    {
      'nvim-telescope/telescope.nvim',
      version = '0.1.9',
      config = function() require("setup/telescope") end,
      requires = {'nvim-lua/plenary.nvim', "folke/which-key.nvim"}
    },
    {
        "andythigpen/nvim-coverage",
        config = function() require("setup/coverage") end,
        requires = { "nvim-lua/plenary.nvim" }
    },
    {
        "catppuccin/nvim",
        version="v1.11.0"
    },
    {"katawful/kat.nvim", version="2.0"},
    {
      "folke/which-key.nvim",
      version = "v3.17.0",
      opts =  {
          plugins = {
              spelling = {
                  enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                  suggestions = 20, -- how many suggestions should be shown in the list?
              },
          },
      },
    }
})
