local nvim_lsp = require "lspconfig"

local enabled_features = {
  "documentHighlights",
  "documentSymbols",
  "foldingRanges",
  "selectionRanges",
  "semanticHighlighting",
  "formatting",
  "codeActions",
}

return {
  filetypes = { "ruby", "rakefile" },
  cmd = { "ruby-lsp" },
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  init_options = {
    enabledFeatures = enabled_features,
  },
}
