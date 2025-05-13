return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require "alpha"

      local dashboard = require("alpha.themes.dashboard")

      local function button(sc, txt, keybind, keybind_opts)
        local b = dashboard.button(sc, txt, keybind, keybind_opts)
        b.opts.hl = "DashboardShortCut"
        b.opts.hl_shortcut = "DashboardHeader"
        return b
      end

      dashboard.section.header.val = {
        "",
        "",
        "",
        "",
        "",
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      }

      dashboard.section.buttons.val = {
        button("הּ f F", "  Find File", "<cmd>FzfLua files<cr>"),
        button("הּ f W", "  Find Word", "<cmd>FzfLua grep_cword<cr>"),
        button("הּ f O", "󱋢  Recent", "<cmd>FzfLua oldfiles<cr>"),
        button("הּ f M", "  Bookmarks", "<cmd>FzfLua marks<cr>"),
      }

      dashboard.section.footer.val = ""
      dashboard.section.footer.opts.hl = "DashboardFooter"

      alpha.setup(dashboard.opts)
    end
  },
}
