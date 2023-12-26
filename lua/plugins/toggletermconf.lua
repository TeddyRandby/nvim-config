return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = function() return vim.o.lines * 0.45 end,
    shade_terminals = false,
    float_opts = {
      border = "solid",
    },
  },
}
