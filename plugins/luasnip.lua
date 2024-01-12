-- nvim-cmp configs
return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("ruby", { "rdoc" })
      require("luasnip").filetype_extend("ruby", { "rails" })

      return opts -- return final config table
    end,
  },
}
