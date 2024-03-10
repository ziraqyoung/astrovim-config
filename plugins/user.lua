return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",

  -- Performance
  -- NOTE: ruby-lsp reload takes forever, not worth it
  -- {
  --   "zeioth/garbage-day.nvim", -- Stops inactive LSP clients to free RAM
  --   event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  --   dependencies = "neovim/nvim-lspconfig",
  --   opts = { notifications = true },
  -- },
  -- Telescope
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function() require("telescope").load_extension "file_browser" end,
  },
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    config = function()
      require("mini.files").setup {
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
        options = {
          -- Whether to use for editing directories
          -- Disabled by default in LazyVim because neo-tree is used for that
          use_as_default_explorer = false,
        },
      }
    end,
  },
  {
    "folke/neodev.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function() require("neodev").setup() end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup {
        lsp = {
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require("lsp_signature").setup(opts) end,
  },

  -- Git and friends
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = function()
      local actions = require "diffview.actions"
      vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
        group = vim.api.nvim_create_augroup("rafi_diffview", {}),
        pattern = "diffview:///panels/*",
        callback = function()
          vim.opt_local.cursorline = true
          vim.opt_local.winhighlight = "CursorLine:WildMenu"
        end,
      })

      return {
        enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
        default = { winbar_info = true },
        file_history = { winbar_info = true },
        hooks = { diff_buf_read = function(bufnr) vim.b[bufnr].view_activated = false end },
        keymaps = {
          view = {
            { "n", "q", actions.close },
            { "n", "<Tab>", actions.select_next_entry },
            { "n", "<S-Tab>", actions.select_prev_entry },
            { "n", "<LocalLeader>a", actions.focus_files },
            { "n", "<LocalLeader>e", actions.toggle_files },
          },
          file_panel = {
            { "n", "q", actions.close },
            { "n", "h", actions.prev_entry },
            { "n", "o", actions.focus_entry },
            { "n", "gf", actions.goto_file },
            { "n", "sg", actions.goto_file_split },
            { "n", "st", actions.goto_file_tab },
            { "n", "<C-r>", actions.refresh_files },
            { "n", "<LocalLeader>e", actions.toggle_files },
          },
          file_history_panel = {
            { "n", "q", "<cmd>DiffviewClose<CR>" },
            { "n", "o", actions.focus_entry },
            { "n", "O", actions.options },
          },
        },
      }
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      -- vim.cmd "highlight default link gitblame SpecialComment"
      -- vim.g.gitblame_enabled = 0
    end,
  },
  -- Testing
  {
    "klen/nvim-test",
    config = function()
      require("nvim-test").setup {
        run = true, -- run tests (using for debug)
        commands_create = true, -- create commands (TestFile, TestLast, ...)
        filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
        silent = false, -- less notifications
        term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
        termOpts = {
          direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
          width = 96, -- terminal's width (for vertical|float)
          height = 24, -- terminal's height (for horizontal|float)
          go_back = false, -- return focus to original window after executing
          stopinsert = "auto", -- exit from insert mode (true|false|"auto")
          keep_one = true, -- keep only one terminal for testing
        },
      }
    end,
  },
  -- Dap
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    config = function() require("dapui").setup() end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    config = function() require("nvim-dap-virtual-text").setup {} end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "suketa/nvim-dap-ruby", config = true },
  },
  -- Other plugins
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    opts = {},
  },
  {
    "ellisonleao/dotenv.nvim",
    event = "VeryLazy",
    config = function() require("dotenv").setup() end,
  },

  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        init = function()
          -- Require providers
          require "hover.providers.lsp"
          require "hover.providers.gh"
          require "hover.providers.man"
          require "hover.providers.dictionary"
        end,
        preview_opts = {
          border = nil,
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
      }
    end,
  },
  -- {
  --   "romgrk/nvim-treesitter-context",
  --   event = "VeryLazy",
  --   config = function()
  --     require("treesitter-context").setup {
  --       enable = true,
  --       throttle = true,
  --       max_lines = 0,
  --       patterns = {
  --         default = {
  --           "class",
  --           "function",
  --           "method",
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "nvimdev/lspsaga.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup {
        ui = {
          border = "rounded",
        },
        lightbulb = {
          enable = false,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true,
        },
        outline = {
          -- left_width = 0.5,
          -- layout = "float",
          max_height = 0.8,
          left_width = 0.4,
        },
        symbol_in_winbar = {
          enable = true,
          hide_keyword = true,
          show_file = true,
          folder_level = 2,
        },
        definition = {
          -- width = 0.8,
          height = 0.8,
        },
      }
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    config = function()
      require("outline").setup {
        outline_window = {
          position = "left",
          width = 15,
        },
      }
    end,
  },
  -- TreeSitter plugins
  {
    "windwp/nvim-ts-autotag", -- autoclose and autorename html tag
    event = "BufRead",
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = { "html", "xml", "eruby", "embedded_template" },
      }
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").on_attach() end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("refactoring").setup {} end,
  },
  { "ray-x/web-tools.nvim" },
  -- Rails
  {
    "stevearc/dressing.nvim", -- for ror.nvim plugin
    config = function()
      require("dressing").setup {
        input = {
          get_config = function()
            -- disable for NvimTree
            if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then return { enabled = false } end
          end,
          min_width = { 60, 0.9 },
        },
        select = {
          -- telescope = require('telescope.themes').get_ivy({...})
          telescope = require("telescope.themes").get_dropdown { layout_config = { height = 15, width = 90 } },
        },
      }
    end,
  },
  {
    "weizheheng/ror.nvim",
    dependencies = { "rcarriga/nvim-notify", "stevearc/dressing.nvim" },
    config = function() require("ror").setup {} end,
  },
  {
    "tpope/vim-bundler",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-rails",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- disable autocmd set filetype=eruby.yaml
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
        pattern = { "*.yml" },
        callback = function() vim.bo.filetype = "yaml" end,
      })
    end,
  },
  {
    "tpope/vim-rake",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "RRethy/nvim-treesitter-endwise",
    -- ft = { "ruby", "lua", "vimscript" },
    event = "InsertEnter",
    config = function()
      require("nvim-treesitter.configs").setup {
        endwise = {
          enable = true,
        },
      }
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "BufReadPre",
    config = function() require("hlargs").setup() end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "tpope/vim-haml",
    ft = { "haml" },
    event = { "BufReadPre", "BufNewFile" },
  },
  "sunaku/vim-ruby-minitest",
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      }
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command "augroup user_plugin_cursorword"
      vim.api.nvim_command "autocmd!"
      vim.api.nvim_command "autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0"
      vim.api.nvim_command "autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif"
      vim.api.nvim_command "autocmd InsertEnter * let b:cursorword = 0"
      vim.api.nvim_command "autocmd InsertLeave * let b:cursorword = 1"
      vim.api.nvim_command "augroup END"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").on_attach() end,
  },
  {
    "ggandor/leap.nvim", --
    name = "leap",
    config = function() require("leap").add_default_mappings() end,
  },
  {
    "peterhoeg/vim-qml",
    event = "BufRead",
    ft = { "qml" },
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = "deep", -- warm, warmer, cool, deep, dark, darker
        term_colors = true,
        ending_tildes = true,
        code_style = {
          comments = "italic",
          keywords = "italic,bold",
          functions = "italic,bold",
          strings = "italic",
        },
      }
    end,
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup {
        background = "medium", -- soft, medium, hard
        italics = false,
      }
    end,
  },
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup {
        disable = {
          colored_cursor = true,
        },
      }
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function() require("nordic").load() end,
  },
}
