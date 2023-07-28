return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }

      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.TelescopePromptNormal = {
        bg = c.bg_dark,
      }

      hl.Telescopebg_darkBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.Telescopebg_darkTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.NormalFloat = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }

      hl.FloatBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.NoiceCmdlineIcon = {
        bg = c.bg_dark,
        fg = c.blue,
      }

      hl.NoiceCmdlinePopupBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.NoiceCmdlinePopupBorderSearch = hl.NoiceCmdlinePopupBorder
      hl.NoiceCmdlinePopupBorderLua = hl.NoiceCmdlinePopupBorder
      hl.NoiceCmdlinePopupBorderHelp = hl.NoiceCmdlinePopupBorder

      hl.NoiceCmdlinePopupTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.NoiceCmdlinePopup = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }

      hl.Pmenu = { bg = "NONE", fg = c.fg_dark }

      hl.PmenuSel = { bg = "NONE", fg = c.fg_dark }

      hl.CmpItemMenu = { bg = "NONE", fg = c.purple }
      hl.CmpItemAbbrMatch = { bg = "NONE", fg = c.cyan }
      hl.CmpItemAbbrMatchFuzzy = { bg = "NONE", fg = c.cyan }

      hl.CmpItemKindCopilot = { bg = c.green, fg = c.bg_dark }
      hl.CmpItemKindField = { bg = c.red, fg = c.bg_dark }
      hl.CmpItemKindProperty = { bg = c.red, fg = c.bg_dark }
      hl.CmpItemKindEvent = { bg = c.red, fg = c.bg_dark }
      hl.CmpItemKindText = { bg = c.green, fg = c.bg_dark }
      hl.CmpItemKindEnum = { bg = c.green, fg = c.bg_dark }
      hl.CmpItemKindKeyword = { bg = c.green, fg = c.bg_dark }
      hl.CmpItemKindConstant = { bg = c.yellow, fg = c.bg_dark }
      hl.CmpItemKindConstructor = { bg = c.yellow, fg = c.bg_dark }
      hl.CmpItemKindReference = { bg = c.yellow, fg = c.bg_dark }
      hl.CmpItemKindFunction = { bg = c.blue, fg = c.bg_dark }
      hl.CmpItemKindStruct = { bg = c.blue, fg = c.bg_dark }
      hl.CmpItemKindClass = { bg = c.blue, fg = c.bg_dark }
      hl.CmpItemKindModule = { bg = c.blue, fg = c.bg_dark }
      hl.CmpItemKindOperator = { bg = c.blue, fg = c.bg_dark }
      hl.CmpItemKindVariable = { bg = c.purple, fg = c.bg_dark }
      hl.CmpItemKindFile = { bg = c.purple, fg = c.bg_dark }
      hl.CmpItemKindUnit = { bg = c.white, fg = c.bg_dark }
      hl.CmpItemKindSnippet = { bg = c.white, fg = c.bg_dark }
      hl.CmpItemKindFolder = { bg = c.white, fg = c.bg_dark }
      hl.CmpItemKindMethod = { bg = c.orange, fg = c.bg_dark }
      hl.CmpItemKindValue = { bg = c.orange, fg = c.bg_dark }
      hl.CmpItemKindEnumMember = { bg = c.orange, fg = c.bg_dark }
      hl.CmpItemKindInterface = { bg = c.pink, fg = c.bg_dark }
      hl.CmpItemKindColor = { bg = c.pink, fg = c.bg_dark }
      hl.CmpItemKindTypeParameter = { bg = c.pink, fg = c.bg_dark }

      hl.NavicIconsFile = { fg = c.purple, bg = c.bg }
      hl.NavicIconsModule = { fg = c.blue, bg = c.bg }
      hl.NavicIconsNamespace = { fg = c.blue, bg = c.bg }
      hl.NavicIconsPackage = { fg = c.blue, bg = c.bg }

      hl.NavicIconsClass = { fg = c.blue, bg = c.bg }
      hl.NavicIconsMethod = { fg = c.orange, bg = c.bg }
      hl.NavicIconsProperty = { fg = c.red, bg = c.bg }
      hl.NavicIconsField = { fg = c.red, bg = c.bg }
      hl.NavicIconsConstructor = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsEnum = { fg = c.green, bg = c.bg }
      hl.NavicIconsInterface = { fg = c.pink, bg = c.bg }
      hl.NavicIconsFunction = { fg = c.blue, bg = c.bg }
      hl.NavicIconsVariable = { fg = c.purple, bg = c.bg }
      hl.NavicIconsEnumMember = { fg = c.orange, bg = c.bg }
      hl.NavicIconsStruct = { fg = c.blue, bg = c.bg }
      hl.NavicIconsEvent = { fg = c.red, bg = c.bg }
      hl.NavicIconsOperator = { fg = c.blue, bg = c.bg }
      hl.NavicIconsTypeParameter = { fg = c.pink, bg = c.bg }
      hl.NavicIconsKeyword = { fg = c.green, bg = c.bg }
      hl.NavicIconsReference = { fg = c.yellow, bg = c.bg }

      hl.NavicIconsConstant = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsString = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsNumber = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsBoolean = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsArray = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsObject = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsNull = { fg = c.yellow, bg = c.bg }
      hl.NavicIconsKey = { fg = c.yellow, bg = c.bg }

      hl.NavicText = { fg = c.fg, bg = c.bg }
      hl.NavicSeparator = { fg = c.fg, bg = c.bg }
    end,
  },
}
