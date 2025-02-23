-- Keymaps
-- Recomendations:
--  - Look for what the keymap used to do before overwite it

local globals = require "globals"
local keymap = globals.keymaps.set

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal Mode --
-- Better window navigation
keymap("n", "<M-h>", "<C-w>h")
keymap("n", "<M-j>", "<C-w>j")
keymap("n", "<M-k>", "<C-w>k")
keymap("n", "<M-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize-2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Buffer operations
keymap("n", "<leader>w", "<cmd>w!<CR>", { desc = "[w]rite current buffer" })

-- Managers
keymap("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "[L]azy panel" })

-- Quit vim
keymap("n", "<Space>q", ":q!<CR>")

-- Insert Mode --

-- Visual Mode --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<M-j>", ":m .+1<CR>==")
keymap("v", "<M-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block Mode --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal Mode --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")
