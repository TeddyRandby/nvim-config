local utils = require("utils")

-- Gutter sign icons
for type, sign in pairs(utils.signs) do
  vim.fn.sign_define(type, sign)
end
