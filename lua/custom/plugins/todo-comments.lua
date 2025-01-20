return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('todo-comments').setup({
      keywords = {
        SEARCH = { icon = "", color = "info" },
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "todo" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      },

      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#C3F550" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
        todo = { "Identifier", "#50ABE7" },
      },
    })
  end,
  --SEARCH: search comment
  --FIX: fix anything below
  --TODO: explain what's there to do
  --WARN: something to be aware here?
  --NOTE: note for the future
}
