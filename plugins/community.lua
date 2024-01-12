return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Tool packs
  -- { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.html-css" }, -- use emmet-language-server instead of emmet_ls
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.test.neotest" },

  -- Themes
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  -- Enhancements
  { import = "astrocommunity.indent.mini-indentscope" },
  {
  "echasnovski/mini.indentscope",
    opts = { symbol = "╎", options = { try_as_border = false, indent_at_cursor = true } },
  },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- PLugins
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  {
    "bufferline.nvim",
    opts = {
      options = {
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        diagnostics = "nvim_lsp",
        color_icons = true,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            -- separator = true
          },
        },
      },
    },
  },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  {
    "glow.nvim",
    opts = {
      width = 200,
      height = 150,
      width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
      height_ratio = 0.8,
    }
  },
}
