local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require "settings"
require "lsp"

local utils = require("utils")

local symbols = utils.icons
local keymaps = utils.keymaps

require "lazy".setup("plugins", {
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = utils.BorderStyle,
    icons = {
      cmd = symbols.Shell,
      event = symbols.Event,
      ft = symbols.File,
      import = symbols.Move,
      loaded = symbols.Installed,
      not_loaded = symbols.Uninstalled,
      config = symbols.Config,
      init = symbols.Config,
      keys =symbols.Keys,
      lazy = symbols.Lazy,
      plugin = symbols.Plugin,
      runtime = symbols.Runtime,
      source = symbols.Source,
      start = symbols.Start,
      task = symbols.Task,
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
      custom_keys = {
        ["i"] = function() require("lazy").install() end,
        ["u"] = function() require("lazy").update() end,
        ["h"] = function() require("lazy").help() end,
        [keymaps.QuitNormal] = function() require("lazy").close() end,
      },
    },
  },
  dev = {
    path = "~/repos/"
  }
})

vim.cmd [[ colorscheme catppuccin ]]
