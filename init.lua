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

local symbols = require("utils")

require "lazy".setup("plugins", {
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "solid",
    pills = false,
    icons = {
      cmd = symbols.Shell,
      config = "",
      event = symbols.Event,
      ft = symbols.File,
      init = " ",
      import = symbols.Move,
      keys = " ",
      lazy = "󰒲 ",
      loaded = symbols.Installed,
      not_loaded = symbols.Uninstalled,
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
      custom_keys = {
        ["i"] = function () require("lazy").install() end,
        ["u"] = function () require("lazy").update() end,
        ["h"] = function () require("lazy").help() end,
        ["q"] = false,
      },
    },
  },
  dev = {
    path = "~/repos/"
  }
})

vim.cmd [[ colorscheme tokyonight-night ]]
