return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require("telescope.actions")
    -- If multiple file selections are detected, open each file. If hitting
    -- <CR> on a single selection fall back to the default behaviour.
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-1679797700
    local select_one_or_multi = function(prompt_bufnr)
      local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require('telescope.actions').close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format("%s %s", "edit", j.path))
          end
        end
      else
        require('telescope.actions').select_default(prompt_bufnr)
      end
    end


    opts.defaults.mappings = {
      i = {
        -- Open files on <Enter>. See above.
        ["<CR>"] = select_one_or_multi,
      },
      n = {
        -- Open files on <Enter>. See above.
        ["<CR>"] = select_one_or_multi,
        ['K'] = actions.preview_scrolling_up,
        ['J'] = actions.preview_scrolling_down,
      }

    }

    return opts
  end
}
