return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").add({

      { "<leader>f", group = "[F]ind / Search options" },
      { "<leader>l", group = "[L] Git / Sessions" },
      { "<leader>n", group = "[N]ew note or file" },
      { "<leader>s", group = "[S]ubstitute current work locally / globaly" },
      -- { "<leader>t", group = "[T]oggle Pencil" },
    })
  end,
}
