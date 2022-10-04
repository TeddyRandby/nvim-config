local utils = require("utils")

vim.g.mapleader = " "

vim.filetype.add {
  extension = {
    gab = "gab",
  },
}

local opts = { noremap = true, silent = true, nowait = true }

vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)
vim.api.nvim_set_keymap("c", "jk", "<ESC>", opts)
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)
vim.api.nvim_set_keymap("n", "L", "<cmd>bn<cr>", opts)
vim.api.nvim_set_keymap("n", "H", "<cmd>bp<cr>", opts)

vim.cmd([[set fcs=eob:\ ]])

local options = {
  termguicolors = true,
  fileencoding = "utf-8",
  backup = false,
  swapfile = false,
  hlsearch = true,
  incsearch = true,
  showmode = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  scrolloff = 5,
  sidescrolloff = 5,
  smartindent = true,
  signcolumn = "yes",
  hidden = true,
  ignorecase = true,
  timeoutlen = 250,
  shiftround = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  number = true,
  relativenumber = true,
  clipboard = "unnamedplus",
  cursorline = false,
  mouse = "a",
  cmdheight = 3,
  undodir = "/tmp/.nvimdid",
  undofile = true,
  pumheight = 5,
  laststatus = 3,
  updatetime = 250,
  background = "dark",
}

vim.opt.shortmess:append("c")

for key, value in pairs(options) do
  vim.opt[key] = value
end

utils.setSpacesSize({ go = 4, python = 4, rust = 4, cpp = 4, c = 4 })
