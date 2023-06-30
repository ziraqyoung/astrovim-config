-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Ror Commands
    ["<leader>rc"] = { ":lua require('ror.commands').list_commands()<CR>" },
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float start_in_insert=true<cr>", desc = "Toggle terminal" },
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>go"] = { "<cmd>Telescope git_status<cr>", desc = "Open changed file" },

    -- Useful LSP configuration
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Show hover" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Goto definition" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Goto Declaration" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Goto references" },
    ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Goto Implementation" },
    ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "show signature help" },
    ["gl"] = {
      function()
        local float = vim.diagnostic.config().float

        if float then
          local config = type(float) == "table" and float or {}
          config.scope = "line"

          vim.diagnostic.open_float(config)
        end
      end,
      desc = "Show line diagnostics",
    },
  },


  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-\\>"] = { "<C-\\><C-n><C-w>l", desc = "Hide terminal" },
  },
}
