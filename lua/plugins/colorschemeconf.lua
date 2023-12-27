return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      local function swap_colors(h)
        local new_hl = {}
        new_hl.fg, new_hl.bg = h.bg, h.fg
        return new_hl
      end

      hl.InclineNormal = { bg = c.bg_highlight, fg = c.fg_dark }
      hl.InclineNormalNC = { bg = c.bg_highlight, fg = c.fg_dark }

      hl.NormalFloat = { bg = c.bg_dark, fg = c.fg_dark }
      hl.FloatBorder = { bg = c.bg_dark, fg = c.bg_dark }

      hl.MasonHeader = { fg = c.orange }
      hl["LazyH1"] = hl.MasonHeader

      hl.LazyButton = { bg = c.bg_highlight, fg = c.fg_dark }
      hl.LazyButtonActive = swap_colors(hl.LazyButton)

      hl.MasonMutedBlock = hl.LazyButton
      hl.MasonHighlightBlock = hl.LazyButtonActive

      hl.NeogitDiffAdd = { fg = c.green, bg = hl.NormalFloat.bg }
      hl.NeogitDiffDelete = { fg = c.red, bg = hl.NormalFloat.bg }
      hl.NeogitDiffContext = { fg = c.fg_dark, bg = hl.NormalFloat.bg }
      hl.NeogitDiffHeader = { fg = c.fg_dark, bg = hl.NormalFloat.bg }

      hl.NeogitDiffAddHighlight = { fg = hl.NeogitDiffAdd.fg, bg = c.bg_highlight }
      hl.NeogitDiffDeleteHighlight = { fg = hl.NeogitDiffDelete.fg, bg = c.bg_highlight }
      hl.NeogitDiffContextHighlight = { fg = hl.NeogitDiffContext.fg, bg = c.bg_highlight }
      hl.NeogitDiffHeaderHighlight = { fg = hl.NeogitDiffHeader.fg, bg = c.bg_highlight }

      hl.NeogitHunkHeader = swap_colors(hl.NeogitDiffHeader)
      hl.NeogitHunkHeaderHighlight = hl.NeogitHunkHeader

      hl.NeogitUntrackedfiles = { fg = c.cyan, bg = hl.NormalFloat.bg }
      hl.NeogitUnstagedchanges = { fg = c.red, bg = hl.NormalFloat.bg }
      hl.NeogitRecentcommits = { fg = c.yellow, bg = hl.NormalFloat.bg }

      hl.NeogitStagedchanges = { fg = c.green, bg = hl.NormalFloat.bg }


      hl.TelescopeNormal = hl.NormalFloat
      hl.TelescopeBorder = hl.FloatBorder

      hl.TelescopePromptPrefix = { bg = hl.TelescopeBorder.bg, fg = c.fg }

      hl.TelescopePromptNormal = { bg = hl.TelescopeNormal.bg, fg = "NONE" }

      hl.TelescopeResultsTitle = hl.TelescopeBorder
      hl.TelescopePreviewTitle = hl.TelescopeResultsTitle

      hl.DapUINormal = { bg = "NONE", fg = "NONE" }
      hl.DapUIValue = { bg = "NONE", fg = "NONE" }

      hl.DapUIFloatNormal = hl.NormalFloat
      hl.DapUIFloatBorder = hl.FloatBorder

      hl.NoiceCmdlinePopup = hl.NormalFloat
      hl.NoiceCmdlinePopupBorder = hl.FloatBorder

      hl.NoiceCmdlinePopupTitle = hl.NoiceCmdlinePopupBorder

      hl.NoiceCmdlineIcon = { bg = hl.NoiceCmdlinePopup.bg, fg = hl.TelescopePromptPrefix.fg }

      hl.NoiceCmdlinePopupBorderSearch = hl.NoiceCmdlinePopupBorder
      hl.NoiceCmdlinePopupBorderLua = hl.NoiceCmdlinePopupBorder
      hl.NoiceCmdlinePopupBorderHelp = hl.NoiceCmdlinePopupBorder

      hl.CmpItemAbbrMatch = { fg = c.cyan }
      hl.CmpItemAbbrMatchFuzzy = { fg = c.cyan }

      hl.CmpItemKind = { fg = hl.NormalFloat.bg }

      hl.CmpItemKindCopilot = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindField = { bg = c.red, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindProperty = { bg = c.red, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindEvent = { bg = c.red, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindText = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindEnum = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindKeyword = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindConstant = { bg = c.yellow, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindConstructor = { bg = c.yellow, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindReference = { bg = c.yellow, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindFunction = { bg = c.blue, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindStruct = { bg = c.blue, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindClass = { bg = c.blue, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindModule = { bg = c.blue, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindOperator = { bg = c.blue, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindVariable = { bg = c.purple, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindFile = { bg = c.purple, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindUnit = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindSnippet = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindFolder = { bg = c.green, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindMethod = { bg = c.orange, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindValue = { bg = c.orange, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindEnumMember = { bg = c.orange, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindInterface = { bg = c.pink, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindColor = { bg = c.pink, fg = hl.CmpItemKind.fg }
      hl.CmpItemKindTypeParameter = { bg = c.pink, fg = hl.CmpItemKind.fg }

      hl.NavicIconsFile = swap_colors(hl.CmpItemKindFile)
      hl.NavicIconsModule = swap_colors(hl.CmpItemKindModule)
      hl.NavicIconsNamespace = swap_colors(hl.CmpItemKindModule)
      hl.NavicIconsPackage = swap_colors(hl.CmpItemKindModule)
      hl.NavicIconsClass = swap_colors(hl.CmpItemKindClass)
      hl.NavicIconsMethod = swap_colors(hl.CmpItemKindMethod)
      hl.NavicIconsProperty = swap_colors(hl.CmpItemKindProperty)
      hl.NavicIconsField = swap_colors(hl.CmpItemKindField)
      hl.NavicIconsConstructor = swap_colors(hl.CmpItemKindConstructor)
      hl.NavicIconsEnum = swap_colors(hl.CmpItemKindEnum)
      hl.NavicIconsInterface = swap_colors(hl.CmpItemKindInterface)
      hl.NavicIconsFunction = swap_colors(hl.CmpItemKindFunction)
      hl.NavicIconsVariable = swap_colors(hl.CmpItemKindVariable)
      hl.NavicIconsEnumMember = swap_colors(hl.CmpItemKindEnumMember)
      hl.NavicIconsStruct = swap_colors(hl.CmpItemKindStruct)
      hl.NavicIconsEvent = swap_colors(hl.CmpItemKindEvent)
      hl.NavicIconsOperator = swap_colors(hl.CmpItemKindOperator)
      hl.NavicIconsTypeParameter = swap_colors(hl.CmpItemKindTypeParameter)
      hl.NavicIconsKeyword = swap_colors(hl.CmpItemKindKeyword)
      hl.NavicIconsReference = swap_colors(hl.CmpItemKindReference)
      hl.NavicIconsConstant = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsString = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsNumber = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsBoolean = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsArray = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsObject = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsNull = swap_colors(hl.CmpItemKindConstant)
      hl.NavicIconsKey = swap_colors(hl.CmpItemKindConstant)

      hl.NavicText = hl.NormalFloat
      hl.NavicSeparator = hl.NormalFloat
    end,
  },
}
