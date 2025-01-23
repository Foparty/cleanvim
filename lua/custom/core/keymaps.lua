vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
-- vim.keymap.set("n", ";", ":", { desc = "Use semicolon as colon" })
vim.keymap.set("i", "kj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })

-- Editing
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })
-- vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], { desc = '[S]ubstitute word instances in file' })
vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format, { desc = "[R]e[F]ormat buffer" })

-- Navigation
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll down full page and center" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll up full page and center" })

-- Diagnosticske
vim.keymap.set("n", "<leader>dg", vim.diagnostic.setloclist, { desc = "Open diagnostics in quickfix list" })
vim.keymap.set("n", "<C-]>", "<cmd>cnext<CR>", { desc = "Go to next quickfix item" })
vim.keymap.set("n", "<C-[>", "<cmd>cprev<CR>", { desc = "Go to previous quickfix item" })

-- Line Manipulation
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("v", "<A-j>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })

-- Buffer and Tab Management

-- vim.keymap.set("n", "<TAB>", ":bn<CR>", { desc = "go to next buffer" })
-- vim.keymap.set("n", "<S-TAB>", ":bp<CR>", { desc = "Save and go to previous buffer" })

-- Window Management
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })
vim.keymap.set("n", "<leader>q", ":wqa!<CR>", { desc = "Save all and [q]uit" })
-- vim.keymap.set('n', '<leader>e', ':up<CR>:Oil<CR>', { desc = ':Ex' })
--
-- NOTE::This will only work with netrw
vim.keymap.set("n", "<up>", function()
  local win_count = vim.fn.winnr("$")
  if win_count > 1 then
    vim.cmd("update")
    vim.cmd("close")
  else
    vim.cmd("update")
    vim.cmd("Oil")
  end
end, { desc = "Close split or open file explorer if last window" })
vim.keymap.set("n", "<C-q>", function()
  vim.cmd("update")
  vim.cmd("Oil")
end, { desc = "Close split or open file explorer if last window" })

vim.keymap.set("n", "<right>", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<down>", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<left>", ":up!<CR>", { desc = "Save current file" }) -- Note: This command seems incorrect, should be ":w<CR>"

vim.keymap.set("n", "<leader>kk", ":bd!<CR>", { desc = "[K]ill current buffer" })
vim.keymap.set("n", "<leader>ka", ":%bd<CR>", { desc = "[K]ill [A]ll buffers" })

-- Terminal Mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- File Operations
vim.keymap.set("n", "<space><space>x", ":so %<CR>", { desc = "Source current file" })

-- plugins system
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>")

-- NOTE: here goes custom mappins for creating new external documents
vim.api.nvim_create_user_command("CreateNewNote", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter note name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = "~/notes/" .. filename
  local expanded_filepath = vim.fn.expand(filepath)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nn", ":CreateNewNote<CR>", { noremap = true, silent = true, desc = "[N]ew [N]ote" })

-- journal one
vim.api.nvim_create_user_command("CreateJournal", function()
  local filename = "~/journal/" .. vim.fn.strftime("%d-%m-%Y") .. ".md"
  local expanded_filename = vim.fn.expand(filename)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filename, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filename) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filename)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filename, "b")
    vim.cmd("edit " .. filename)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nj", ":CreateJournal<CR>", { desc = "[N]ew [J]ournal note" })
