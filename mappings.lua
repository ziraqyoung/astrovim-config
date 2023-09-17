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
    ["<leader>bb"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    ["<leader>bn"] = { "<cmd>BufferLineCycleNext<cr>", desc = "New Buffer" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },

    -- Telescope
    ["<leader>go"] = { "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    ["<leader>fs"] = { ":lua require('telescope.builtin').find_files({ search_dirs = {vim.fn.expand('%:p:h')} })<CR>", desc = "Find file in this buffer's working directory" },

    -- Useful LSP configuration
    ["K"] = { "<cmd>lua require('hover').hover()<cr>", desc = "hover.nvim" },
    ["gK"] = { "<cmd>lua require('hover').hover_select()<cr>", desc = "hover.nvim(select)" },
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

    -- Neotest
    ["<leader>dm"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "Test Method" },
    ["<leader>dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Test Method DAP" },
    ["<leader>df"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", desc = "Test Class" },
    ["<leader>dF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = "Test Class DAP" },
    ["<leader>dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Test Summary" },

    -- Noice
    ["<leader>n"] = { name = "Notifications" },
    ["<leader>nl"] = { "<cmd>lua require('noice').cmd('last')<cr>", desc = "Show last notification" },
    ["<leader>nh"] = { "<cmd>lua require('noice').cmd('history')<cr>", desc = "Show notification history" },
    ["<leader>nd"] = { "<cmd>lua require('noice').cmd('dismiss')<cr>", desc = "Dismiss all visible notifications" },

    -- Other PLugins
    ["<leader>rc"] = { ":lua require('ror.commands').list_commands()<CR>" },
    ["<leader>a"] = { "<cmd>AerialToggle<CR>" },
    ["<C-\\>"] = { "<cmd>ToggleTerm direction=float start_in_insert=true<cr>", desc = "Toggle terminal" },

    -- Trouble (assumes <leader>x for Trouble)
    ["<leader>xt"] = { "<cmd>TroubleToggle<cr>", desc = "Trouble" },
    ["<leader>xr"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP references" },
    ["<leader>xd"] = { "<cmd>TroubleToggle lsp_definitions<cr>", desc = "LSP definitions" },
    ["<leader>xT"] = { "<cmd>TroubleToggle lsp_type_definitions<cr>", desc = "LSP type definitions" },
    ["<leader>xi"] = { "<cmd>TroubleToggle lsp_implementations<cr>", desc = "LSP implementations" },
    
    -- Dropbar
    ["<leader>tt"] = { "<cmd>lua require('dropbar.api').pick()<cr>", desc = "Dropbar menu" },
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-\\>"] = { "<C-\\><C-n><C-w>l", desc = "Hide terminal" },
    ["<C-v>"] = { "<C-\\><C-n>", desc = "Enter visual mode" },
  },
}
