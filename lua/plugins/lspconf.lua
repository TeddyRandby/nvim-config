local servers = { "bashls", "jsonls", "sqlls", "gopls", "lua_ls", "clangd", "basedpyright", "jdtls" }
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
      }
    },
    config = function()
      for _, server in ipairs(servers) do
        local ok, res = pcall(require, "lsp.servers." .. server)
        if ok then
          vim.lsp.config(server, res)
        end
        vim.lsp.enable(server)
      end
    end,
  },
}
