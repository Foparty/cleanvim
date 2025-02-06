-- local mappings = require("telescope.mappings")
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"rcarriga/nvim-notify",
		"debugloop/telescope-undo.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				layout_config = {
					width = 0.99,
					height = 0.99,
					preview_cutoff = 60,
					horizontal = {
						-- Adjust these values to make the preview larger than the results
						prompt_position = "top",
						preview_width = 0.65, -- 75% of the available space for preview
						results_width = 0.35, -- 25% for results
					},
				},
				mappings = {
					i = {
						["<C-q>"] = require("telescope.actions").smart_send_to_qflist
							+ require("telescope.actions").open_qflist,
					},
					n = {
						["<C-q>"] = require("telescope.actions").smart_send_to_qflist
							+ require("telescope.actions").open_qflist,
					},
				},
			},
			-- pickers = {}
			extensions = {
				notify = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("telescope").load_extension("undo")
		vim.keymap.set("n", "<leader>uh", "<cmd>Telescope undo<cr>", { desc = "[U]ndo [H]istory" })
		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>.", function()
			builtin.oldfiles({ only_cwd = true })
		end, { desc = "[S]earch Recent Files" })
		vim.keymap.set("n", "<leader>,", function()
			builtin.buffers()
		end, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")

		--NOTE: git stuff
		vim.keymap.set("n", "<leader>gh", builtin.git_bcommits, { desc = "[G]it [H]istory of current file" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })

		-- vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorschemes" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		require("telescope").load_extension("notify")
		vim.keymap.set(
			"n",
			"<leader>nh",
			require("telescope").extensions.notify.notify,
			{ desc = "[N]otification [H]istory" }
		)

		vim.keymap.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config"), prompt_title = "Config Files" })
		end, { desc = "[S]earch [C]onfig files" })

		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({
				prompt_title = "Find in Notes",
				cwd = "~/notes",
			})
		end, { desc = "Find in external notes" })
		vim.keymap.set("n", "<leader>fm", function()
			builtin.live_grep({
				prompt_title = "Live Grep in Notes",
				cwd = "~/notes",
			})
		end, { desc = "Search terms in external notes" })
	end,
}
