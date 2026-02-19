vim.g.mapleader = " "

vim.filetype.add({
	extension = {
		gab = "gab",
		hurl = "hurl",
	},
})

local opts = { noremap = true, silent = true, nowait = true }

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = "term://*",
	command = "startinsert",
})

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

-- Use Alt+nav keys to navigate window panes.
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", opts)

-- Use Alt+nav keys to navigate window panes (In term mode also).
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", opts)
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", opts)
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", opts)
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", opts)

-- Shift + h/l to cycle through buffers
vim.api.nvim_set_keymap("n", "L", "<cmd>bnext<cr>", opts)
vim.api.nvim_set_keymap("n", "H", "<cmd>bprev<cr>", opts)

-- Shift + j/k to cycle through tab
vim.api.nvim_set_keymap("n", "J", "<cmd>tabnext<cr>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>tabprev<cr>", opts)

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
	completeopt = "noinsert,menuone,popup",
	completeitemalign = "kind,abbr,menu",
	pumheight = 0,
}

vim.opt.shortmess:append("c")

for key, value in pairs(options) do
	vim.opt_global[key] = value
end

vim.o.guicursor = "n-v-c-sm-i-ci-ve:block,a:Cursor/lCursor"
