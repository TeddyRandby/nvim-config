---Utility for keymap creation.
---@param lhs string
---@param rhs string|function
---@param opts string|table
---@param mode? string|string[]
local function keymap(lhs, rhs, opts, mode, bufnr)
  opts = type(opts) == 'string' and { desc = opts }
      or vim.tbl_extend('error', opts --[[@as table]], { buffer = bufnr })
  mode = mode or 'n'
  vim.keymap.set(mode, lhs, rhs, opts)
end

---For replacing certain <C-x>... keymaps.
---@param keys string
local function feedkeys(keys)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
end

---Is the completion menu open?
local function pumvisible()
  return tonumber(vim.fn.pumvisible()) ~= 0
end

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
              -- local cmp_nvim_lsp = require("cmp_nvim_lsp")

              local conf_ok, try_conf = pcall(require, "lsp.servers." .. server)

              local lsp_icons = require('utils').lsp_icons
              local lsp_groups = require('utils').lsp_groups

              local conf = vim.tbl_extend("keep", conf_ok and try_conf or {}, {
                on_attach = function(client, bufnr)
                  if client.supports_method("textDocument/inlayHints") then
                    vim.lsp.inlay_hint.enable(true)
                  end

                  if client.supports_method("textDocument/signatureHelp") then
                    -- Maybe there is some keymaps or something to be done here?
                  end

                  -- Enable completion and configure keybindings.
                  -- if client.supports_method("textDocument/codelens") then
                  --   keymap('K', function()
                  --     vim.lsp.codelens.run()
                  --   end, { expr = true }, 'n', bufnr)
                  -- end

                  if client.supports_method("textDocument/diagnostics") then
                    vim.diagnostic.config({
                      float = {
                        source = false,
                        prefix = "",
                        border = require('utils').BorderStyle ,
                      },
                      signs = false,
                      underline = true,
                      update_in_insert = false,
                    })
                  end

                  -- Enable completion and configure keybindings.
                  if client.supports_method("textDocument/completion") then
                    local highlights = lsp_groups()
                    -- Autocmd for triggering completion on insert char.
                    vim.api.nvim_create_autocmd('InsertCharPre', {
                      buffer = bufnr,
                      callback = function()
                        if pumvisible() or vim.fn.state('m') == 'm' then
                          return
                        end

                        -- Send the
                        local key = vim.keycode('<C-x><C-o>')
                        vim.api.nvim_feedkeys(key, 'm', false)
                      end
                    })

                    vim.lsp.completion.enable(true, client.id, bufnr, {
                      convert = function(item)
                        local icon = lsp_icons[item.kind] or ""
                        local iconhl = highlights[item.kind] or nil
                        local text = item.label or ""

                        return {
                          abbr = text,
                          kind = icon,
                          -- abbr_hlgroup = "@character",
                          kind_hlgroup = iconhl,
                          menu = item.menu,
                        }
                      end
                    })

                    -- Use enter to accept completions.
                    keymap('<cr>', function()
                      return pumvisible() and '<C-y>' or '<cr>'
                    end, { expr = true }, 'i', bufnr)

                    -- Use slash to dismiss the completion menu.
                    keymap('/', function()
                      return pumvisible() and '<C-e>' or '/'
                    end, { expr = true }, 'i', bufnr)

                    -- Use <C-n> to navigate to the next completion or:
                    -- - Trigger LSP completion.
                    -- - If there's no one, fallback to vanilla omnifunc.
                    keymap('<C-j>', function()
                      if pumvisible() then
                        feedkeys '<Down>'
                      else
                        feedkeys '<C-j>'
                      end
                    end, 'Select next completion', 'i', bufnr)

                    keymap('<C-k>', function()
                      if pumvisible() then
                        feedkeys '<Up>'
                      else
                        feedkeys '<C-k>'
                      end
                    end, 'Select prev completion', 'i', bufnr)

                    -- Buffer completions.
                    keymap('<C-u>', '<C-x><C-n>', { desc = 'Buffer completions' }, 'i', bufnr)

                    -- Use <Tab> to navigate between snippet tabstops,
                    -- Do something similar with <S-Tab>.
                    keymap('<Tab>', function()
                      if vim.snippet.active { direction = 1 } then
                        vim.snippet.jump(1)
                      elseif pumvisible() then
                        feedkeys '<C-y>'
                      else
                        feedkeys '<Tab>'
                      end
                    end, {}, { 'i', 's' }, bufnr)

                    keymap('<S-Tab>', function()
                      if vim.snippet.active { direction = -1 } then
                        vim.snippet.jump(-1)
                      elseif pumvisible() then
                        feedkeys('<C-p>')
                      else
                        feedkeys '<S-Tab>'
                      end
                    end, {}, { 'i', 's' }, bufnr)

                    -- Inside a snippet, use backspace to remove the placeholder.
                    keymap('<BS>', '<C-o>s', {}, 's', bufnr)
                  end
                end,
                flags = {},
                settings = {},
              })

              require("lspconfig")[server].setup(conf)
            end
          },
        },
      }
    },
  },
}
