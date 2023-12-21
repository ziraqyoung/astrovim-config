-- nvim-cmp configs
return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, config)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("ruby", { "rdoc" })
      require("luasnip").filetype_extend("ruby", { "rails" })

      return config -- return final config table
    end,
  },
}
