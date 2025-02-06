return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = true,
        -- your explorer configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            layout = {
              cycle = false,
            },
            -- your explorer picker configuration comes here
            -- or leave it empty to use the default settings
          },
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          Snacks.picker.explorer()
        end,
        desc = "Explorer",
      },
    },
  },
}
