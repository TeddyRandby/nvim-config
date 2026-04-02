local function gh(repo)
	return "https://github.com/" .. repo
end

vim.pack.add {
	gh("catppuccin/nvim"),
	gh("kyazdani42/nvim-web-devicons"),
	gh("ibhagwan/fzf-lua"),
	gh("neovim/nvim-lspconfig"),
	gh("nvim-treesitter/nvim-treesitter"),
	gh("nvim-treesitter/nvim-treesitter-textobjects"),
	gh("lewis6991/gitsigns.nvim"),
	gh("folke/which-key.nvim"),
	gh("williamboman/mason.nvim"),
  gh("nvim-lualine/lualine.nvim"),
}

require "settings"

vim.treesitter.language.add("gab", { "gab" })

vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	callback = function()
		require("nvim-treesitter.parsers").gab = {
			install_info = {
				url = "https://github.com/gab-language/tree-sitter-gab",
				queries = "queries", -- also install queries from given directory
			},
			filetype = "gab",
		}
	end,
})

local function lsp_clients()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  local names = {}

  for _, value in ipairs(clients) do
    table.insert(names, value.name)
  end

  return table.concat(names, require("utils").icons.MiddleSeparator)
end

require "lualine" .setup {
  options = {
    disabled_filetypes = {
      winbar = { "taboo" },
    },
    icons_enabled = true,
    theme = "auto",
    section_separators = {
      left = require("utils").icons.LeftSeparatorSolid,
      right = require("utils").icons.RightSeparatorSolid
    },
    component_separators = {
      left = require("utils").icons.LeftSeparator,
      right = require("utils").icons.RightSeparator
    },
    always_divide_middle = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    globalstatus = true,
  },
  tabline = {
    lualine_z = {
      {
        "tabs",
        mode = 1,
      },
    },
  },
  sections = {
    lualine_a = { "mode", "branch" },
    lualine_b = {
      {
        "filetype",
        icon_only = true,
      },
      {
        "filename",
        path = 4,
        file_status = false,
      },
    },
    lualine_c = {
      {
        "diff",
        symbols = {
          added = require("utils").icons.Added,
          modified = require("utils").icons.Changed,
          removed = require("utils").icons.Removed,
        },
      },
      {
        "diagnostics",
        symbols = {
          error = require("utils").icons.Error,
          warn = require("utils").icons.Warning,
          hint = require("utils").icons.Hint,
          info = require("utils").icons.Info,
        },
      },
    },
    lualine_x = {
      {
        "windows",
        mode = 0,
      },
    },
    lualine_y = {},
    lualine_z = { lsp_clients },
  },
  inactive_sections = {},
  winbar = {},
  inactive_winbar = {},
}

require("nvim-treesitter").setup({})

require("nvim-treesitter").install({
	"c",
	"make",
	"regex",
	"vim",
	"lua",
	"markdown",
	"markdown_inline",
	"bash",
	"dockerfile",
	"go",
	"gomod",
	"json",
	"toml",
	"yaml",
	"graphql",
	"css",
	"html",
	"python",
	"javascript",
	"typescript",
	"hurl",
	"prisma",
})

vim.treesitter.language.register("gab", { "gab" })

require("fzf-lua").setup({
	"ivy",
	keymap = {
		fzf = {
			true,
			["ctrl-o"] = "select-all+accept",
		},
	},
})

require("mason").setup({})

require("which-key").setup({
	preset = "helix",
	spec = {
		{
			mode = { "v" },
			{
				"<leader>/",
				"gc",
				remap = true,
			},
			{
				"<leader>d",
				group = "[DAP]",
			},
			{
				"<leader>dh",
				"<cmd>lua require('dapui').elements.watches.add()<cr>",
			},
		},
		{
			mode = { "n" },
			{
				"<leader>/",
				"gcc",
				desc = "[COMMENT] Line",
				remap = true,
			},
			{
				"<leader>;",
				"<cmd>Alpha<cr>",
				desc = "[HOME]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>r",
				group = "[REPL]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>m",
				group = "[MOLTEN]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>ml",
				"<cmd>MoltenEvaluateLine<cr>",
				desc = "[EVAL] Line",
				remap = false,
			},
			{
				"<leader>me",
				"<cmd>MoltenEvaluateOperator<cr>",
				desc = "[EVAL] Operator",
				remap = false,
			},
			{
				"<leader>b",
				group = "[DEBUG]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bB",
				"<cmd>Telescope dap list_breakpoints initial_mode=normal<cr>",
				desc = "[FIND] Breakpoints",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bC",
				"<cmd>DapLoadLaunchJSON<cr><cmd>Telescope dap configurations initial_mode=normal<cr>",
				desc = "[FIND] Configurations",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bb",
				"<cmd>DapToggleBreakpoint<cr>",
				desc = "Toggle breakpoint",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bc",
				"<cmd>DapLoadLaunchJSON<cr><cmd>DapContinue<cr>",
				desc = "Continue",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bh",
				"<cmd>lua require('dapui').elements.watches.add()<cr>",
				desc = "Hover",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bi",
				"<cmd>DapStepInto<cr>",
				desc = "Step into",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bj",
				"<cmd>DapStepOver<cr>",
				desc = "Step over",
				nowait = true,
				remap = false,
			},
			{
				"<leader>bk",
				"<cmd>DapStepOut<cr>",
				desc = "Step out",
				nowait = true,
				remap = false,
			},
			{
				"<leader>n",
				"<cmd>tabnew<cr>",
				desc = "[TAB+]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>c",
				"<cmd>tabnew term://clide<cr>",
				desc = "[CLIDE]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>s",
				"<cmd>split term://" .. vim.o.shell .. "<cr>",
				desc = "[SHELL]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>v",
				"<cmd>tabnew term://lazygit<cr>",
				desc = "[LAZYGIT]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>d",
				"<cmd>lua require('dapui').toggle() <cr>",
				desc = "[DEBUG]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>f",
				group = "[FILE]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fB",
				"<cmd>FzfLua buffers<cr>",
				desc = "[FIND] Buffers",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fF",
				"<cmd>FzfLua files<cr>",
				desc = "[FIND] File",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fM",
				"<cmd>FzfLua marks<cr>",
				desc = "[FIND] Marks",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fO",
				"<cmd>FzfLua oldfiles<cr>",
				desc = "[FIND] Recent",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fT",
				"<cmd>FzfLua tabs<cr>",
				desc = "[FIND] Tabs",
				nowait = true,
				remap = false,
			},
			{
				"<leader>fW",
				"<cmd>FzfLua live_grep<cr>",
				desc = "[FIND] Word",
				nowait = true,
				remap = false,
			},
			{
				"<leader>g",
				group = "[GIT]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gB",
				"<cmd>FzfLua git_branches<cr>",
				desc = "[FIND] Branches",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gS",
				"<cmd>FzfLua git_status<cr>",
				desc = "[FIND] Status",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gb",
				"<cmd>Gitsigns blame_line<cr>",
				desc = "Blame line",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gh",
				"<cmd>Gitsigns preview_hunk_inline<cr>",
				desc = "View hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gj",
				"<cmd>Gitsigns next_hunk<cr>",
				desc = "Next hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>gk",
				"<cmd>Gitsigns prev_hunk<cr>",
				desc = "Previous hunk",
				nowait = true,
				remap = false,
			},
			{
				"<leader>l",
				group = "[LSP]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lD",
				"<cmd>FzfLua lsp_definitions<cr>",
				desc = "[FIND] Definition",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lE",
				"<cmd>FzfLua diagnostics_document<cr>",
				desc = "[FIND] Diagnostics",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lI",
				"<cmd>FzfLua lsp_implementations<cr>",
				desc = "[FIND] Implementation",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lR",
				"<cmd>FzfLua lsp_references<cr>",
				desc = "[FIND] Reference",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lS",
				"<cmd>FzfLua lsp_document_symbols<cr>",
				desc = "[FIND] Symbol",
				nowait = true,
				remap = false,
			},
			{
				"<leader>la",
				"<cmd>lua vim.lsp.buf.code_action()<cr>",
				desc = "Code action",
				nowait = true,
				remap = false,
			},
			{
				"<leader>le",
				"<cmd>lua vim.diagnostic.open_float()<cr>",
				desc = "Preview diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lf",
				"<cmd>lua vim.lsp.buf.format{ async = true}<cr>",
				desc = "Format",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lh",
				"<cmd>lua vim.lsp.buf.hover()<cr>",
				desc = "Hover",
				nowait = true,
				remap = false,
			},
			{
				"<leader>li",
				"<cmd>LspInfo<cr>",
				desc = "Info",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lj",
				"<cmd>lua vim.diagnostic.jump { count = 1 }<cr>",
				desc = "Next diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lk",
				"<cmd>lua vim.diagnostic.jump { count = -1 }<cr>",
				desc = "Prev diagnostic",
				nowait = true,
				remap = false,
			},
			{
				"<leader>lr",
				"<cmd>lua vim.lsp.buf.rename()<cr>",
				desc = "Rename",
				nowait = true,
				remap = false,
			},
			{
				"<leader>y",
				"<cmd>Mason<cr>",
				desc = "[MASON]",
				nowait = true,
				remap = false,
			},
			{
				"<leader>z",
				"<cmd>Lazy<cr>",
				desc = "[LAZY]",
				nowait = true,
				remap = false,
			},
		},
	},
})

require("lsp")

local lsp_servers = { "clangd", "lua_ls", "jsonls", "bashls" }

for _, server in ipairs(lsp_servers) do

	vim.lsp.enable(server)
end

vim.cmd([[ colorscheme catppuccin ]])
