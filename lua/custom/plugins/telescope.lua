-- local mappings = require("telescope.mappings")
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          width = 0.99,
          height = 0.99,
          preview_cutoff = 60,
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
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    local function search_tag()
      -- Get the word under the cursor or selection
      local word = vim.fn.expand("<cword>")

      -- Prepend '#' to the word
      local search_string = "[[" .. word .. "]]"

      -- Call grep_string with the modified search string
      require('telescope.builtin').grep_string({ search = search_string })
    end
    -- vim.keymap.set("n", "<leader>fk", search_tag, { desc = "[S]earch [K]eywords" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
    vim.keymap.set("n", "<leader><leader>", function()
      builtin.buffers()
    end, { desc = "[ ] Find existing buffers" })


    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })

    vim.keymap.set("n", "<leader>fo", function()
      builtin.find_files({
        prompt_title = "Find in Notes",
        cwd = "/Users/fo/notes",
      })
    end, { desc = 'Find in external notes' })
    vim.keymap.set("n", "<leader>fp", function()
      builtin.live_grep({
        prompt_title = "Live Grep in Notes",
        cwd = "/Users/fo/notes",
      })
    end, { desc = "Search terms in external notes" })
  end,
}
