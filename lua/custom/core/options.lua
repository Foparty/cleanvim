vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_icons = 1
--Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.softtabstop = 2 -- 2 spaces for indent width (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
-- vim.opt.autoindent = true -- copy indent from current line when starting new one
-- vim.opt.smartindent = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.opt.conceallevel = 1 --something for obsidian
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent

-- Save undo history
vim.opt.undofile = true

vim.opt.breakindent = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.termguicolors = true
vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

vim.opt.wrap = false
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])

vim.opt.spelllang = "es"
-- vim.opt.spell = true
vim.g.single_quote = true
-- or for a specific buffer
vim.api.nvim_buf_set_var(0, "single_quote", true)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
