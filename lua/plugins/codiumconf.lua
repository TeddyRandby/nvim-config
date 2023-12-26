return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    opts = {
      config_path = os.getenv("HOME") .. "/.local/share/nvim/codeium/apikey",
      bin_path = os.getenv("HOME") .. "/.local/share/nvim/codeium/",
    },
}
