vim.g.mapleader = " "

vim.filetype.add({
  extension = {
    gab = "gab",
  },
})

local opts = { noremap = true, silent = true, nowait = true }

vim.api.nvim_set_keymap("i", require('utils').keymaps.LeaveInsert, "<esc>", opts)
vim.api.nvim_set_keymap("t", require('utils').keymaps.Quit, "<C-\\><C-N>", opts)

vim.api.nvim_set_keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", opts)
vim.api.nvim_set_keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", opts)
vim.api.nvim_set_keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", opts)
vim.api.nvim_set_keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", opts)
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-N><C-w>h", opts)
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-N><C-w>j", opts)
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-N><C-w>k", opts)
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-N><C-w>l", opts)
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", opts)

vim.api.nvim_set_keymap("n", "L", "<cmd>bn<cr>", opts)
vim.api.nvim_set_keymap("n", "H", "<cmd>bp<cr>", opts)
vim.api.nvim_set_keymap("n", "J", "<cmd>tabn<cr>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>tabp<cr>", opts)

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
  cmdheight = 1,
  pumheight = 15,
  undodir = "/tmp/.nvimdid",
  undofile = true,
  laststatus = 3,
  updatetime = 250,
  background = "dark",
  wrap = false,
}

vim.opt.shortmess:append("c")

for key, value in pairs(options) do
  vim.opt[key] = value
end
