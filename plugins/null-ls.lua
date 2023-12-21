return {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { { 'neovim/nvim-lspconfig' }, { 'nvim-lua/plenary.nvim' } },
  --   opts = function(_, config)
  --     -- config variable is the default configuration table for the setup function call
  --     local null_ls = require "null-ls"

  --     config.sources = {
  --       -- Set a formatter
  --       -- null_ls.builtins.diagnostics.haml_lint,
  --       -- null_ls.builtins.formatting.erb_lint,
  --       null_ls.builtins.formatting.erb_format({}),
  --       -- null_ls.builtins.formatting.prettier({}),
  --     }
  --     return config -- return final config table
  --   end,
}
