local ok, alpha = pcall(require, "alpha")

if ok then
    local dashboard = require "alpha.themes.dashboard"

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
        "",
        "                               _              ",
        "        ____  ___  ____ _   __(_)___ ___      ",
        "       / __ \/ _ \/ __ \ | / / / __ `__ \     ",
        "      / / / /  __/ /_/ / |/ / / / / / / /     ",
        "     /_/ /_/\___/\____/|___/_/_/ /_/ /_/      ",
        "",
        "",
        "",
        "",
        "",
        "",
    }
    dashboard.section.buttons.val = {
        button("הּ f f", "  Find File", "<cmd>Telescope find_files<cr>"),
        button("הּ f o", "  Recents", "<cmd>Telescope oldfiles<cr>"),
        button("הּ f g", "  Find Word", "<cmd>Telescope live_grep<cr>"),
        button("הּ f m", "  Bookmarks", "<cmd>Telescope marks<cr>"),
    }
    dashboard.section.footer.val = ""
    dashboard.section.footer.opts.hl = "DashboardFooter"

    alpha.setup(dashboard.opts)
end
