return {
  "folke/tokyonight.nvim",
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      local function swap_colors(h)
        local new_hl = {}
        new_hl.fg, new_hl.bg = h.bg, h.fg
        return new_hl
      end

      hl.HelpVim = { bg = c.bg_highlight, fg = c.fg_highlight}

      hl.NormalFloat = { bg = c.bg_dark, fg = c.fg_dark }
      hl.FloatBorder = { bg = c.bg_dark, fg = c.bg_dark }

      hl.MasonHeader = { fg = c.orange }
      hl["LazyH1"] = hl.MasonHeader

      hl.LazyButton = { bg = c.bg_highlight, fg = c.fg_dark }
      hl.LazyButtonActive = swap_colors(hl.LazyButton)

      hl.MasonMutedBlock = hl.LazyButton
      hl.MasonHighlightBlock = hl.LazyButtonActive

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
    end,
  },
}
