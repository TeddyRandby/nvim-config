return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    enabled = true,
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        ensure_installed = {
          "c",
          "make",
          "regex",
          "vim",
          "lua",
          "markdown",
          "markdown_inline",
          "bash",
          "dockerfile",
          "go",
          "gomod",
          "json",
          "toml",
          "yaml",
          "graphql",
          "css",
          "html",
          "python",
          "javascript",
          "typescript",
          "hurl",
        },
        highlight = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,

            include_surrounding_whitespace = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
              ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
              ["iu"] = { query = "@block.inner", desc = "Select the body of a block" },
              ["au"] = { query = "@block.outer", desc = "Select an entire block" },
              ["ia"] = { query = "@parameter.inner", desc = "Select a parameter" },
              ["aa"] = { query = "@parameter.outer", desc = "Select a whole parameter list" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ["@parameter.outer"] = "v",    -- charwise
              ["@function.inner"] = "<c-v>", -- linewise
              ["@function.outer"] = "V",     -- linewise
              ["@class.inner"] = "<c-v>",    -- blockwise
              ["@class.outer"] = "V",        -- blockwise
              ["@block.inner"] = "<c-v>",
              ["@block.outer"] = "V",
            },
          },
        },
      })

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.gab = {
        install_info = {
          url = "https://github.com/TeddyRandby/tree-sitter-gab", -- local path or git repo
          files = { "src/parser.c" },
          -- optional entries:
          branch = "main",                       -- default branch in case of git repo if different from master
          generate_requires_npm = false,         -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
        },
        filetype = "gab",                        -- if filetype does not match the parser name
      }
    end,
  },
}
