-- vim.keymap.set({"n", "i"}, "<C-a>b", "<Cmd>lua print('hello world')<CR>", {silent = true})
-- vim.keymap.set({"n", "i"}, "<C-a>b", function() print("hello world") end, {silent = true})

-- 撤销,save,删行
vim.keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>", {silent = true})
vim.keymap.set({"n", "i"}, "<C-s>", "<Cmd>w<CR>", {silent = true})
vim.keymap.set({"n", "i"}, "<C-x>", "<ESC>dd", {silent = true})

-- 设置leader快捷键
vim.g.mapleader = " "
vim.keymap.set({"n"}, "<leader>gg", "<Cmd>lua print(123)<CR>", {silent = true})

-- 换行插入
vim.keymap.set({"n", "i"}, "<A-o>", "<ESC>o", {silent = true})
vim.keymap.set({"n", "i"}, "<A-O>", "<ESC>O", {silent = true})
