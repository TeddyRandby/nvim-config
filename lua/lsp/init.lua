local utils = require("utils")

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


local lsp_icons = require('utils').lsp_icons
local lsp_groups = require('utils').lsp_groups

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = vim.api.nvim_get_current_buf()

    -- if client.supports_method("textDocument/signatureHelp") then
    --   -- Maybe there is some keymaps or something to be done here?
    -- end

    -- Enable completion and configure keybindings.
    -- if client.supports_method("textDocument/codelens") then
    --   keymap('K', function()
    --     vim.lsp.codelens.run()
    --   end, { expr = true }, 'n', bufnr)
    -- end

    if client:supports_method("textDocument/diagnostics") then
      vim.diagnostic.config({
        float = {
          source = false,
          prefix = "",
          border = require('utils').BorderStyle,
        },
        signs = false,
        underline = true,
        update_in_insert = false,
      })
    end


    -- Enable completion and configure keybindings.
    if client:supports_method("textDocument/completion") then
      vim.notify("Attack completion");
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
          }
        end
      })

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

      keymap('<CR>', function()
        if pumvisible() then
          feedkeys '<C-e><CR>'
        else
          feedkeys '<CR>'
        end
      end, 'Override default enter completion', 'i', bufnr)

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
  end
})

-- Gutter sign icons
for type, sign in pairs(utils.signs) do
  vim.fn.sign_define(type, sign)
end
