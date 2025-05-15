return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "bashls", "jsonls", "sqlls", "gopls", "lua_ls", "clangd", "basedpyright", "jdtls" },
        },
      }
    },
  },
}
