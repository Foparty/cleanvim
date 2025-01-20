return {
  {
    'rmagatti/auto-session',
    lazy = false,
    config = function()
      require('auto-session').setup({
        suppressed_dirs = { '~/Downloads', },
        session_lens = {
          load_on_startup = true,
          theme_conf = { border = true },
          previewer = false
        },
        vim.keymap.set('n', '<leader>ls', require('auto-session.session-lens').search_session,
          { desc = "[L]ist [S]essions" })
      })
    end
  }
}
