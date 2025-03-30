vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- [[ Setting options ]]
-- See `:help vim.opt`

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_icons = 1
--Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2      -- 2 spaces for tabs (prettier default)
vim.opt.softtabstop = 2  -- 2 spaces for indent width (prettier default)
vim.opt.shiftwidth = 2   -- 2 spaces for indent width
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
vim.opt.background = "dark"            -- colorschemes that can be light or dark will be made dark

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

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])

vim.opt.spelllang = { "es" }
-- vim.opt.spell = true
vim.diagnostic.config({ virtual_lines = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client:supports_method("textDocument/completion") then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("lua require('lazygit.utils').project_root_dir()")
  end,
})
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

-- NOTE: Here comes the stausbar config
-- --
-- -- Define highlight groups with a better-looking color palette
-- vim.api.nvim_set_hl(0, "StatusLineNormal", { bg = "#2563EB", fg = "#e8f0fe", bold = true })
-- vim.api.nvim_set_hl(0, "StatusLineInsert", { bg = "#DC2626", fg = "#ffffff", bold = true })
-- vim.api.nvim_set_hl(0, "StatusLineVisual", { bg = "#50ABE7", fg = "#202124", bold = true })
-- vim.api.nvim_set_hl(0, "StatusLineCommand", { bg = "#FBBF24", fg = "#000000", bold = true })
-- vim.api.nvim_set_hl(0, "StatusLineReplace", { bg = "#d93025", fg = "#ffffff", bold = true })
--
-- -- Configuration table mapping modes to status line highlights and display text
-- local mode_config = {
-- 	n = { hl = "StatusLineNormal", text = "[N]" }, -- Normal mode
-- 	i = { hl = "StatusLineInsert", text = "[I]" }, -- Insert mode
-- 	v = { hl = "StatusLineVisual", text = "[V]" }, -- Visual mode (character-wise)
-- 	V = { hl = "StatusLineVisual", text = "[VL]" }, -- Visual mode (line-wise)
-- 	["\22"] = { hl = "StatusLineVisual", text = "[VB]" }, -- Visual mode (block-wise, Ctrl-V)
-- 	c = { hl = "StatusLineCommand", text = "[C]" }, -- Command mode
-- 	r = { hl = "StatusLineReplace", text = "[R]" }, -- Replace mode
-- }
--
-- local git_status_cache = {}
--
-- -- Function to update the Git status cache for the current buffer
-- local function update_git_status()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
-- 	if branch == "" or vim.v.shell_error ~= 0 then
-- 		git_status_cache[bufnr] = ""
-- 		return
-- 	end
--
-- 	local status = ""
-- 	local diff = vim.fn.system("git status --porcelain 2>/dev/null")
-- 	if diff ~= "" then
-- 		local added = diff:match("A") and "+" or ""
-- 		local modified = diff:match("M") and "*" or ""
-- 		local deleted = diff:match("D") and "-" or ""
-- 		status = " " .. added .. modified .. deleted
-- 	end
-- 	git_status_cache[bufnr] = " " .. branch .. status
-- end
--
-- local function get_git_status()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	if not git_status_cache[bufnr] then
-- 		update_git_status()
-- 	end
-- 	return git_status_cache[bufnr] or ""
-- end
--
-- -- Function to generate the status line dynamically
-- function _G.statusline()
-- 	-- Get the current mode
-- 	local mode = vim.api.nvim_get_mode().mode
-- 	-- Select the mode configuration, default to Normal if mode is unrecognized
-- 	local config = mode_config[mode] or mode_config.n
-- 	-- Get the Git branch
-- 	local git_info = get_git_status()
-- 	-- Construct the status line string with the mode-specific highlight
-- 	return "%#" .. config.hl .. "#  " .. config.text .. " " .. git_info .. "  %<%t %m %y %= %l:%c %P"
-- end
--
-- -- Set the statusline option to use the Lua function
-- vim.o.statusline = "%!v:lua.statusline()"
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
-- 	callback = function()
-- 		update_git_status()
-- 	end,
-- })
