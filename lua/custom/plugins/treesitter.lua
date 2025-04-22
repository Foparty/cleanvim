return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		keys = {
			{ "<c-space>", desc = "Increment Selection" },
			{ "<bs>", desc = "Decrement Selection", mode = "x" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"astro",
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"glimmer_javascript",
					"glimmer_typescript",
					"html",
					"css",
					"scss",
					"json",
					"tsx",
					"javascript",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
