local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

vim.cmd([[packadd packer.nvim]])

local ok, packer = pcall(require, "packer")

if not ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" }) end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600,
  },
  auto_clean = true,
  compile_on_sync = false,
})

return packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })

  -- UI
  use({ "Mofiqul/dracula.nvim", config = require("plugins.configs.draculaconf") })

  use({ "goolord/alpha-nvim", config = require("plugins.configs.alphaconf") })

  use({ "kyazdani42/nvim-web-devicons", config = require("plugins.configs.deviconsconf") })

  use({
    "nvim-lualine/lualine.nvim",
    config = require("plugins.configs.lualineconf"),
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = require("plugins.configs.bufferlineconf"),
  })

  use({ "folke/which-key.nvim", config = require("plugins.configs.whichkeyconf") })

  use({ "karb94/neoscroll.nvim", config = require("plugins.configs.neoscrollconf") })

  -- Syntax
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "windwp/nvim-ts-autotag",
      "p00f/nvim-ts-rainbow",
    },
    run = ":TSUpdate",
    config = require("plugins.configs.treesitterconf"),
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = require("plugins.configs.telescopeconf"),
  })

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.configs.indentconf") })

  use({ "windwp/nvim-autopairs", config = require("plugins.configs.autopairsconf") })

  use({ "norcalli/nvim-colorizer.lua", config = require("plugins.configs.colorizerconf") })

  use({
    "RRethy/vim-illuminate",
  })

  -- LSP
  use({
    "williamboman/nvim-lsp-installer",
    requires = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/typescript.nvim",
    },
  })

  use({
    "glepnir/lspsaga.nvim",
    config = require("plugins.configs.lspsagaconf")
  })

  -- Comment
  use({ "numToStr/Comment.nvim", config = require("plugins.configs.commentconf") })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = require("plugins.configs.cmpconf"),
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = require("plugins.configs.gitsignsconf"),
  })

  -- Markdown
  use({
    "davidgranstrom/nvim-markdown-preview",
    config = function()
      vim.g.nvim_markdown_preview_format = "gfm"
      vim.g.nvim_markdown_preview_theme = "github"
    end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
