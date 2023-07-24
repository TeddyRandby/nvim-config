return {
  {
    "Mofiqul/dracula.nvim",
    config = function()
      local dracula = require("dracula")

      dracula.setup({
        overrides = {
          NormalFloat = { bg = dracula.colors().menu, fg = dracula.colors().fg },
          FloatBorder = { bg = dracula.colors().menu, fg = dracula.colors().menu },
          TreeSitterContext = { bg = dracula.colors().bg, fg = dracula.colors().fg },
          TreeSitterContextBottom = { underline = false },

          TelescopeTitle = { bg = "NONE", fg = dracula.colors().bg },
          TelescopeNormal = { bg = "NONE", fg = dracula.colors().fg },
          TelescopeSelection = { bg = dracula.colors().selection, fg = dracula.colors().fg },
          TelescopePromptBorder = { bg = dracula.colors().menu, fg = dracula.colors().menu },
          TelescopePromptNormal = { bg = dracula.colors().menu, fg = dracula.colors().fg },
          TelescopePromptPrefix = { bg = dracula.colors().menu, fg = dracula.colors().fg },
          TelescopeResultsNormal = { bg = dracula.colors().menu, fg = dracula.colors().fg },
          TelescopeResultsBorder = { bg = dracula.colors().menu, fg = dracula.colors().menu },

          WhichKeyFloat = { bg = dracula.colors().menu, fg = "NONE" },

          IndentBlanklineChar = { fg = dracula.colors().gutter_fg },

          GitSignsAdd = { bg = dracula.colors().bg, fg = dracula.colors().bright_green },
          GitSignsChange = { bg = dracula.colors().bg, fg = dracula.colors().bright_yellow },
          GitSignsDelete = { bg = dracula.colors().bg, fg = dracula.colors().bright_red },

          Pmenu = { bg = "NONE", fg = dracula.colors().fg },
          PmenuSel = { bg = "NONE", fg = dracula.colors().fg },
          CmpItemMenu = { bg = "NONE", fg = dracula.colors().purple },

          CmpItemAbbrMatch = { bg = "NONE", fg = dracula.colors().cyan },
          CmpItemAbbrMatchFuzzy = { bg = "NONE", fg = dracula.colors().cyan },

          CmpItemKindCopilot = { bg = dracula.colors().bright_green, fg = dracula.colors().menu },
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

          NavicIconsFile = { fg = dracula.colors().bright_magenta, bg = dracula.colors().bg },
          NavicIconsModule = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },
          NavicIconsNamespace = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },
          NavicIconsPackage = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },

          NavicIconsClass = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },
          NavicIconsMethod = { fg = dracula.colors().orange, bg = dracula.colors().bg },
          NavicIconsProperty = { fg = dracula.colors().red, bg = dracula.colors().bg },
          NavicIconsField = { fg = dracula.colors().red, bg = dracula.colors().bg },
          NavicIconsConstructor = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsEnum = { fg = dracula.colors().green, bg = dracula.colors().bg },
          NavicIconsInterface = { fg = dracula.colors().pink, bg = dracula.colors().bg },
          NavicIconsFunction = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },
          NavicIconsVariable = { fg = dracula.colors().bright_magenta, bg = dracula.colors().bg },
          NavicIconsEnumMember = { fg = dracula.colors().orange, bg = dracula.colors().bg },
          NavicIconsStruct = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },
          NavicIconsEvent = { fg = dracula.colors().red, bg = dracula.colors().bg },
          NavicIconsOperator = { fg = dracula.colors().bright_blue, bg = dracula.colors().bg },
          NavicIconsTypeParameter = { fg = dracula.colors().pink, bg = dracula.colors().bg },
          NavicIconsKeyword = { fg = dracula.colors().green, bg = dracula.colors().bg },
          NavicIconsReference = { fg = dracula.colors().yellow, bg = dracula.colors().bg },

          NavicIconsConstant = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsString = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsNumber = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsBoolean = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsArray = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsObject = { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsNull= { fg = dracula.colors().yellow, bg = dracula.colors().bg },
          NavicIconsKey = { fg = dracula.colors().yellow, bg = dracula.colors().bg },

          NavicText = { fg = dracula.colors().fg, bg = dracula.colors().bg },
          NavicSeparator = { fg = dracula.colors().fg, bg = dracula.colors().bg },
        },
      })

      vim.cmd([[colorscheme dracula]])
    end,
  },
}
