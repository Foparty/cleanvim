return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      require("mini.surround").setup()
      require("mini.ai").setup({ n_lines = 500 })

      local statusline = require 'mini.statusline'
      local function counts()
        local counts = vim.fn.wordcount()
        return counts.chars .. " CC," .. counts.words .. " WC"
      end
      statusline.setup {
        content = {

          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git           = MiniStatusline.section_git({ trunc_width = 40 })
            local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
            -- local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
            local filename      = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.')
            local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 320 })
            local location      = MiniStatusline.section_location({ trunc_width = 75 })
            local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, counts() } },
              { hl = mode_hl,                  strings = { search, location } },
            })
          end,
        },
        use_icons = true
      }
    end
  },
}
