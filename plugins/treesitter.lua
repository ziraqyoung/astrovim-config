return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "html", "css", "javascript", "ruby", "rust", "go", "c", "yaml",
      "embedded_template", "json", "markdown", "markdown_inline", "python", "regex", "scss", "typescript", "toml", "lua"
      -- "lua"
    })
  end,
}
