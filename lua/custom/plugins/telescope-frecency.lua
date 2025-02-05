return {
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          frecency = {
            show_scores = true,
            show_filter_column = false,
          },
        },
      })
      require("telescope").load_extension("frecency")
    end,
  },
}
