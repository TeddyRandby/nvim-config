return {
	{
		"Mofiqul/dracula.nvim",
		config = function()
			local dracula = require("dracula")

			dracula.setup({
				-- set italic comment
				italic_comment = true, -- default false
				overrides = {
          NormalFloat = { bg = dracula.colors().menu, fg = dracula.colors().fg },
          FloatBorder = { bg = dracula.colors().menu, fg = dracula.colors().menu },

					TelescopeNormal = { bg = dracula.colors().menu, fg = dracula.colors().fg },
					TelescopeTitle = { bg = dracula.colors().menu, fg = dracula.colors().purple },
					TelescopeResultsBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
					TelescopeResultBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
					TelescopePreviewBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },
					TelescopePromptBorder = { bg = dracula.colors().menu, fg = dracula.colors().fg },

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

					CmpItemKindField = { fg = dracula.colors().red, bg = dracula.colors().menu },
					CmpItemKindProperty = { fg = dracula.colors().red, bg = dracula.colors().menu },
					CmpItemKindEvent = { fg = dracula.colors().red, bg = dracula.colors().menu },
					CmpItemKindText = { fg = dracula.colors().green, bg = dracula.colors().menu },
					CmpItemKindEnum = { fg = dracula.colors().green, bg = dracula.colors().menu },
					CmpItemKindKeyword = { fg = dracula.colors().green, bg = dracula.colors().menu },
					CmpItemKindConstant = { fg = dracula.colors().yellow, bg = dracula.colors().menu },
					CmpItemKindConstructor = { fg = dracula.colors().yellow, bg = dracula.colors().menu },
					CmpItemKindReference = { fg = dracula.colors().yellow, bg = dracula.colors().menu },
					CmpItemKindFunction = { fg = dracula.colors().bright_blue, bg = dracula.colors().menu },
					CmpItemKindStruct = { fg = dracula.colors().bright_blue, bg = dracula.colors().menu },
					CmpItemKindClass = { fg = dracula.colors().bright_blue, bg = dracula.colors().menu },
					CmpItemKindModule = { fg = dracula.colors().bright_blue, bg = dracula.colors().menu },
					CmpItemKindOperator = { fg = dracula.colors().bright_blue, bg = dracula.colors().menu },
					CmpItemKindVariable = { fg = dracula.colors().bright_magenta, bg = dracula.colors().menu },
					CmpItemKindFile = { fg = dracula.colors().bright_magenta, bg = dracula.colors().menu },
					CmpItemKindUnit = { fg = dracula.colors().white, bg = dracula.colors().menu },
					CmpItemKindSnippet = { fg = dracula.colors().white, bg = dracula.colors().menu },
					CmpItemKindFolder = { fg = dracula.colors().white, bg = dracula.colors().menu },
					CmpItemKindMethod = { fg = dracula.colors().orange, bg = dracula.colors().menu },
					CmpItemKindValue = { fg = dracula.colors().orange, bg = dracula.colors().menu },
					CmpItemKindEnumMember = { fg = dracula.colors().orange, bg = dracula.colors().menu },
					CmpItemKindInterface = { fg = dracula.colors().pink, bg = dracula.colors().menu },
					CmpItemKindColor = { fg = dracula.colors().pink, bg = dracula.colors().menu },
					CmpItemKindTypeParameter = { fg = dracula.colors().pink, bg = dracula.colors().menu },
				},
			})

			vim.cmd([[colorscheme dracula]])
		end,
	},
}
