-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    -- guicursor = "i:block", --  set cursor of insert mode as block.
    -- guicursor = "n-v-c:block-Cursor/lCursor",
    guicursor = {
      "n-v:block-block-Cursor/lCursor",
      "i-c-ci-ve:ver25-Cursor/lCursor",
      "r-cr:hor20",
      "o:hor50",
      "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
      "sm:block-blinkwait175-blinkoff150-blinkon175",
    },
    scrolloff = 2,
    foldcolumn = "1", -- '0' is not bad
    foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
    foldlevelstart = 99,
    foldenable = true,
    list = true,
    listchars = {
      eol = "↲",
      space = "·",
      tab = "» ",
      trail = "·",
      extends = "<",
      precedes = ">",
      nbsp = "␣",
      conceal = "┊",
    },
    wrap = true,
    completeopt = 'menuone,noselect',
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
