return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "prismals", "bashls", "jsonls", "sqlls", "gopls", "lua_ls", "clangd", "eslint" },
          handlers = {
            function(server)
              local cmp_nvim_lsp = require("cmp_nvim_lsp")

              local conf_ok, try_conf = pcall(require, "lsp.servers." .. server)

              local conf = vim.tbl_extend("keep", conf_ok and try_conf or {}, {
                on_attach = function() end,
                flags = {},
                settings = {},
                capabilities = cmp_nvim_lsp.default_capabilities(),
              })

              require("lspconfig")[server].setup(conf)
            end
          },
        },
      }
    },
    config = false,
  },
}
