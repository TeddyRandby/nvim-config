local M = {}

local telescope = require("telescope")
local gitsigns = require("gitsigns")

local function hunks()
  local all_hunks = {}

  for i = 0, vim.fn.bufnr("$") do
    table.insert(all_hunks, #all_hunks, gitsigns.get_hunks(i))
  end

  print(vim.inspect(all_hunks[1]))
end

M.hunks = hunks

return M
