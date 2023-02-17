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

					CmpItemKindField = { fg = dracula.colors().red, bg = "NONE"},
					CmpItemKindProperty = { fg = dracula.colors().red, bg = "NONE"},
					CmpItemKindEvent = { fg = dracula.colors().red, bg = "NONE"},
					CmpItemKindText = { fg = dracula.colors().green, bg = "NONE"},
					CmpItemKindEnum = { fg = dracula.colors().green, bg = "NONE"},
					CmpItemKindKeyword = { fg = dracula.colors().green, bg = "NONE"},
					CmpItemKindConstant = { fg = dracula.colors().yellow, bg = "NONE"},
					CmpItemKindConstructor = { fg = dracula.colors().yellow, bg = "NONE"},
					CmpItemKindReference = { fg = dracula.colors().yellow, bg = "NONE"},
					CmpItemKindFunction = { fg = dracula.colors().bright_blue, bg = "NONE"},
					CmpItemKindStruct = { fg = dracula.colors().bright_blue, bg = "NONE"},
					CmpItemKindClass = { fg = dracula.colors().bright_blue, bg = "NONE"},
					CmpItemKindModule = { fg = dracula.colors().bright_blue, bg = "NONE"},
					CmpItemKindOperator = { fg = dracula.colors().bright_blue, bg = "NONE"},
					CmpItemKindVariable = { fg = dracula.colors().bright_magenta, bg = "NONE"},
					CmpItemKindFile = { fg = dracula.colors().bright_magenta, bg = "NONE"},
					CmpItemKindUnit = { fg = dracula.colors().white, bg = "NONE"},
					CmpItemKindSnippet = { fg = dracula.colors().white, bg = "NONE"},
					CmpItemKindFolder = { fg = dracula.colors().white, bg = "NONE"},
					CmpItemKindMethod = { fg = dracula.colors().orange, bg = "NONE"},
					CmpItemKindValue = { fg = dracula.colors().orange, bg = "NONE"},
					CmpItemKindEnumMember = { fg = dracula.colors().orange, bg = "NONE"},
					CmpItemKindInterface = { fg = dracula.colors().pink, bg = "NONE"},
					CmpItemKindColor = { fg = dracula.colors().pink, bg = "NONE"},
					CmpItemKindTypeParameter = { fg = dracula.colors().pink, bg = "NONE"},
				},
			})

			vim.cmd([[colorscheme dracula]])
		end,
	},
}
