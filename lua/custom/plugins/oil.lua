return {
	{
		"stevearc/oil.nvim",
		enabled = true,
		config = function()
			local oil = require("oil")
			oil.setup({
				keymaps = {
					["g?"] = { "actions.show_help", mode = "n" },
					["<CR>"] = "actions.select",
					["<C-s>"] = false,
					["<C-v>"] = { "actions.select", opts = { vertical = true } },
					["<C-h>"] = false,
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = { "actions.close", mode = "n" },
					["q"] = { "actions.close", mode = "n" },
					["<C-l>"] = false,
					["-"] = { "actions.parent", mode = "n" },
					["_"] = { "actions.open_cwd", mode = "n" },
					["`"] = { "actions.cd", mode = "n" },
					["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
					["gs"] = { "actions.change_sort", mode = "n" },
					["gx"] = "actions.open_external",
					["g."] = { "actions.toggle_hidden", mode = "n" },
					["g\\"] = { "actions.toggle_trash", mode = "n" },
				},
			})
			vim.keymap.set("n", "-", oil.toggle_float, {})
		end,
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
}
