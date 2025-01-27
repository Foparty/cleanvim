return {
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false,
    config = function()
      require("markview").setup({})
      require("markview.extras.checkboxes").setup()
      require("markview.extras.editor").setup()
      require("markview.extras.headings").setup()
    end,
  },
}
