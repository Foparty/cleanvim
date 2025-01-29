return {
	{
		"OXY2DEV/markview.nvim",
		enabled = true,
		lazy = false,
		ft = "markdown",
		config = function()
			require("markview").setup({
				-- hybrid_modes = { "n", "i" },
				preview = {
					hybrid_modes = { "n", "i" },
				},
			})
			require("markview.extras.checkboxes").setup()
			require("markview.extras.editor").setup({})
			require("markview.extras.headings").setup()
		end,
	},
}
