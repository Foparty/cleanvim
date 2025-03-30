-- local Snacks = require("snacks")
return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    enabled = true,
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = true,
      },
      -- notify = { enabled = true },
      -- notifier = { enabled = true },
      terminal = { enabled = true },
      picker = {
        layout = {
          -- fullscreen = true,
          cycle = false,
          layout = {
            width = 0.95,
            height = 0.95,
          },
        },
        matcher = {
          frecency = true,
        },
        sources = {
          explorer = {
            -- hidden = true,
            -- ignored = true,
            -- exclude = { ".git" },
            auto_close = false,
            layout = {
              layout = {
                width = 0.2,
                height = 1,
              },
              fullscreen = false,
            },
          },
        },
      },
    },
    keys = {

      {
        "<C-e>",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer Toggle",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.smart({
            finders = { "files" },
            filter = { cwd = true },
          })
        end,
        desc = "Find Files",
      },

      {
        "<leader>,",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Find Files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      -- {
      --   "<leader>.",
      --   function()
      --     Snacks.terminal()
      --   end,
      -- },
      {
        "<leader>fc",
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },

      {
        "<leader>fh",
        function()
          Snacks.picker.help()
        end,
        desc = "Help",
      },
      {
        "<leader>fn",
        function()
          Snacks.picker.files({ cwd = "~/notes/" })
        end,
        desc = "Find Notes",
      },
      {
        "<leader>fm",
        function()
          Snacks.picker.grep({ cwd = "~/notes/" })
        end,
        desc = "Grep Notes",
      },
      --lsp

      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gD",
        function()
          Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
      },
      -- {
      -- 	"grr",
      -- 	function()
      -- 		Snacks.picker.lsp_references()
      -- 	end,
      -- 	nowait = true,
      -- 	desc = "References",
      -- },
      {
        "gI",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      {
        "<leader>ss",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
      {
        "<leader>sS",
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "LSP Workspace Symbols",
      },
    },
  },
}
