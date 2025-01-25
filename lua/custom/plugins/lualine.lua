return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function words()
        return vim.fn.wordcount().words .. " WC"
      end
      local function time()
        return os.date("%H:%M")
      end
      local colors = {
        red = "#ca1243",
        grey = "#a0a1a7",
        black = "#383a42",
        white = "#f3f3f3",
        light_green = "#83a598",
        orange = "#fe8019",
        green = "#8ec07c",
      }
      local theme = {
        normal = {
          a = { fg = colors.white, bg = colors.red },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.black, bg = colors.white },
          z = { fg = colors.white, bg = colors.black },
        },
        command = { a = { fg = colors.black, bg = colors.green } },
        insert = { a = { fg = colors.black, bg = colors.orange } },
        visual = { a = { fg = colors.black, bg = colors.orange } },
        replace = { a = { fg = colors.black, bg = colors.green } },
      }
      require("lualine").setup({
        options = {
          icons_enabled = true,
          -- theme = theme,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            "filename", --[["filesize"]]
          },
          lualine_x = {
            --[["encoding",]]
            --[["fileformat",]]
            "filetype",
          },
          lualine_y = {
            "progress", --[[ { "location" }]]
          },
          lualine_z = { words, time },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}
