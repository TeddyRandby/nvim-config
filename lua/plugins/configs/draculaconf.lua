local ok, dracula = pcall(require, "dracula")

if not ok then
  return
end

dracula.setup({
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
    FloatBorder = { bg = dracula.colors().bg, fg = dracula.colors().selection },
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
    CmpItemKindVariable = { bg = dracula.colors().bright_magenta, fg = dracula.colors().menu },
    CmpItemKindFile = { bg = dracula.colors().bright_magenta, fg = dracula.colors().menu },
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

vim.cmd([[colorscheme dracula]])
