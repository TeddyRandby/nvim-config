local ok, dracula = pcall(require, "dracula")

if not ok then
  return
end

dracula.setup({
  -- customize dracula color palette
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C", yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
  },
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  overrides = {
    TelescopeNormal = { bg = dracula.colors().menu, fg = dracula.colors().fg },
    TelescopeTitle = { bg = dracula.colors().menu, fg = dracula.colors().purple },
    TelescopeResultsBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
    TelescopeResultBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
    TelescopePreviewBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
    TelescopePromptBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
    WhichKeyFloat = { bg = dracula.colors().menu, fg = dracula.colors().fg },
    GitSignsAdd = { bg = dracula.colors().bg, fg = dracula.colors().bright_green },
    GitSignsChange = { bg = dracula.colors().bg, fg = dracula.colors().bright_yellow },
    GitSignsDelete = { bg = dracula.colors().bg, fg = dracula.colors().bright_red },
    PMenu = { bg = "NONE", fg = "NONE" },
    PMenuSel = { bg = "NONE", fg = "NONE" },
    PMenuSBar = { bg = "NONE", fg = "NONE" },
    PMenuThumb = { bg = dracula.colors().menu, fg = "NONE" },
    CmpItemMenu = { bg = "NONE", fg = dracula.colors().purple },
    CmpItemAbbrMatch = { bg = "NONE", fg = dracula.colors().cyan },
    CmpItemAbbrMatchFuzzy = { bg = "NONE", fg = dracula.colors().cyan },
    CmpItemKindField = { bg = dracula.colors().red, fg = dracula.colors().menu },
    CmpItemKindProperty = { bg = dracula.colors().red, fg = dracula.colors().menu },
    CmpItemKindEvent = { bg = dracula.colors().red, fg = dracula.colors().menu },
    CmpItemKindText = { bg = dracula.colors().green, fg = dracula.colors().menu },
    CmpItemKindEnum = { bg = dracula.colors().green, fg = dracula.colors().menu },
    CmpItemKindKeyword = { bg = dracula.colors().green, fg = dracula.colors().menu },
    CmpItemKindConstant = { bg = dracula.colors().yellow, fg = dracula.colors().menu },
    CmpItemKindConstructor = { bg = dracula.colors().yellow, fg = dracula.colors().menu },
    CmpItemKindReference = { bg = dracula.colors().yellow, fg = dracula.colors().menu },
    CmpItemKindFunction = { bg = dracula.colors().bright_blue, fg = dracula.colors().menu },
    CmpItemKindStruct = { bg = dracula.colors().bright_blue, fg = dracula.colors().menu },
    CmpItemKindClass = { bg = dracula.colors().bright_blue, fg = dracula.colors().menu },
    CmpItemKindModule = { bg = dracula.colors().bright_blue, fg = dracula.colors().menu },
    CmpItemKindOperator = { bg = dracula.colors().bright_blue, fg = dracula.colors().menu },
    CmpItemKindVariable = { bg = dracula.colors().magenta, fg = dracula.colors().menu },
    CmpItemKindFile = { bg = dracula.colors().magenta, fg = dracula.colors().menu },
    CmpItemKindUnit = { bg = dracula.colors().white, fg = dracula.colors().menu },
    CmpItemKindSnippet = { bg = dracula.colors().white, fg = dracula.colors().menu },
    CmpItemKindFolder = { bg = dracula.colors().white, fg = dracula.colors().menu },
    CmpItemKindMethod = { bg = dracula.colors().orange, fg = dracula.colors().menu },
    CmpItemKindValue = { bg = dracula.colors().orange, fg = dracula.colors().menu },
    CmpItemKindEnumMember = { bg = dracula.colors().orange, fg = dracula.colors().menu },
    CmpItemKindInterface = { bg = dracula.colors().pink, fg = dracula.colors().menu },
    CmpItemKindColor = { bg = dracula.colors().pink, fg = dracula.colors().menu },
    CmpItemKindTypeParameter = { bg = dracula.colors().pink, fg = dracula.colors().menu },
  },
})

vim.cmd [[colorscheme dracula]]
