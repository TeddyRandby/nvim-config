vim.g.mapleader = " "

vim.filetype.add({
  extension = {
    gab = "gab",
    hurl = "hurl",
  },
})


local opts = { noremap = true, silent = true, nowait = true }

-- Move the selected range up one, and correct indentation
vim.api.nvim_set_keymap("v", "K", ":m -2<CR>==gv", opts)
vim.api.nvim_set_keymap("v", "J", ":m +1<CR>==gv", opts)

-- Convenient escape from insert mode
vim.api.nvim_set_keymap("i", "jj", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

-- Arrow keys for resizing windows
vim.api.nvim_set_keymap("n", "<Up>", "<C-w>+", opts)
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>-", opts)
vim.api.nvim_set_keymap("n", "<Left>", "<C-w><", opts)
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>>", opts)

-- Shift + h/l to cycle through buffers
vim.api.nvim_set_keymap("n", "L", "<cmd>bn<cr>", opts)
vim.api.nvim_set_keymap("n", "H", "<cmd>bp<cr>", opts)

-- Shift + j/k to cycle through tabs
vim.api.nvim_set_keymap("n", "J", "<C-\\><C-N><cmd>TabooNext skip preview<cr>", opts)
vim.api.nvim_set_keymap("n", "K", "<C-\\><C-N><cmd>TabooPrev skip preview<cr>", opts)

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
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,
  indentexpr = "nvim_treesitter#indentexpr()",
  showtabline = 0,
}

vim.opt.shortmess:append("c")

for key, value in pairs(options) do
  vim.opt_global[key] = value
end

vim.o.guicursor= 'n-v-c-sm-i-ci-ve:block,a:Cursor/lCursor'
