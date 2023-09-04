local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
{
  "neovim/nvim-lspconfig",

   dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
},
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed  = {
        "clangd"
      }
    }
  }
}
return plugins
