-- lua/keymaps.lua

-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- pindah ke windows kiri dengan memencet ctrl + h
keymap("n", "<C-j>", "<C-w>j", opts) -- pindah ke windows bawah dengan memencet ctrl + j
keymap("n", "<C-k>", "<C-w>k", opts) -- pindah ke windows ke atas dengan ctrl + k
keymap("n", "<C-l>", "<C-w>l", opts) -- pindah ke windows ke kanan dengan memencet ctrl + l

-- Save file
-- save file dengan memencet ctrl + s
-- menyimpan semua file yang terbuka
-- ctrl = shift + s
keymap("n", "<C-S>", ":wa<CR>", opts) -- save all open buffers / all open files

-- all open files
-- untuk menyimpan semua file yang terbuka di simpan sekaligus
-- key yang berfungsi untuk lompat keatas file
-- dengan esc lalu + gg
keymap("n", "<leader>a", "ggVG", opts) -- Select all content in the file

-- Additional useful keymaps
keymap("n", "<leader>q", ":q<CR>", opts) -- keluar | + q
keymap("n", "<leader>x", ":xa<CR>", opts) -- Save and quit
keymap("n", "<leader>sc", ":nohlsearch<cr>", opts) -- clear e highlight search
keymap("i", "kj", "<Esc>", opts) -- keluar dari mode insert
keymap("n", ";", ":", { noremap = true, silent = false }) -- ; to :
keymap("n", "<leader>sv", "<C-w>v", opts) -- Split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- Split window horizontally
-- keymap("n", "<leader>ef", ":Ex<CR>", opts)

-- Nvim tree
keymap("n", "<leader>e", ":Neotree reveal<CR>", opts) -- nvim tree
-- keymap("n", "<leader>e", ":NvimTreeOpen<CR>", opts)

-- Mapping/Keybindings for bufferline
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts) -- Move next buffer
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts) -- Move prev buffer
keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", opts) -- Close current buffer
keymap("n", "<leader>cb", ":bd<CR>", opts) -- Close current buffer
keymap("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts) -- Close left buffers

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Find files
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts) -- Live grep
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- Buffers
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts) -- Help
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", opts) -- Colorscheme
keymap("n", "<leader>fe", ":Telescope file_browser<CR>", opts) -- file_browser
keymap("n", "<leader>ss", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
keymap("n", "<leader>cc", ":lua require('telescope.builtin').commands()<CR>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts) -- Increment
keymap("n", "-", "<C-x>", opts) -- Decrement

-- Inc-Rename
keymap("n", "<leader>rn", ":IncRename ", opts)

-- ToggleTerm
-- keymap("n", "<leader>tf", "<cmd>ToggleTerm <CR>", opts) -- Open terminal
-- keymap("t", "<Esc>", "<C-\\><C-n><cmd>ToggleTerm<CR>", opts) -- Keybinding to close terminal with Esc

-- git signs
keymap("n", "<leader>gs", ":Gitsigns<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", opts)

-- lazy git
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n><cmd>q<CR>", opts) -- exit lazygit with esc
