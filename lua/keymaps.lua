local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap

-- bufferの移動
keymap("n", "<C-n>", ":bnext<Return>", opts)
keymap("n", "<C-p>", ":bprevious<Return>", opts)

vim.api.nvim_set_keymap("i","jj", "<ESC>", { noremap = true, silent = true})


-- Option + nでNeoTreeShow
keymap("n", "<M-n>", ":NeoTreeShowToggle<Return>", opts)
