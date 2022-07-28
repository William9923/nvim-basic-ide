-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Fast saving with Ctrl + s
keymap('n', '<C-s>', ':w<CR>', opts)

-- Select All with Ctrl + a
keymap('n', '<C-a>', 'gg<S-v>G', opts)
keymap('v', '<C-a>', 'gg<S-v>G', opts)

-- Easier Replace
keymap('n', 'r', 'R', opts)

-- Increment/decrement digits
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Delete without yanking
keymap('n', '<leader>d', '"_d', opts)
keymap('n', 'x', '"_x', opts)

-- Open current directories + File
keymap('n', 'te', ':tabedit<CR>', opts) -- new tab
keymap('n', '<S-Tab>', ':tabprev<Return>', opts) -- prev tab
keymap('n', '<Tab>', ':tabnext<Return>', opts) -- next tab

-- Splitting windows
keymap('n', '<leader>ss', ':split<Return><C-w>w', opts) -- split windows (horizontal)
keymap('n', '<leader>sv', ':vsplit<Return><C-w>w', opts) -- split windows (vertical)
keymap('n', '<leader>sq', '<C-w>q', opts) -- close split windows

-- Stay in normal/visual mode when entering
keymap('n', '<CR>', 'i<CR><esc>', opts)
keymap('v', '<CR>', 'i<CR><esc>', opts)

-- Insert --
-- Press kk fast to enter
keymap("i", "kk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==gv', opts)
keymap('v', '<A-k>', ':m .-2<CR>==gv', opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- LSP --
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>Trouble lsp_references<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Special command (Formatting)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", ";f", ":Telescope find_files<CR>", opts)
keymap("n", ";r", ":Telescope live_grep<CR>", opts)
keymap("n", ";p", ":Telescope projects<CR>", opts)
keymap("n", ";b", ":Telescope buffers<CR>", opts)
keymap("n", ";d", ":Telescope diagnostics<CR>", opts)
keymap("n", ";t", ":TodoTelescope<CR>", opts)
keymap("n", ";h", ":Telescope help_tags<CR>", opts)
keymap("n", ";k", ":Telescope keymaps<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Aerial
-- Toggle the aerial window with <leader>a
keymap('n', '<leader>a', '<cmd>AerialToggle!<CR>', opts)
-- Jump up the tree with '[[' or ']]'
keymap('n', '[[', '<cmd>AerialPrevUp<CR>', opts)
keymap('n', ']]', '<cmd>AerialNextUp<CR>', opts)

-- Barbar
-- Move to previous/next tab
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next tab
keymap('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position <x>
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- Magic buffer-picking mode
keymap('n', '<A-p>', '<Cmd>BufferPick<CR>', opts)
