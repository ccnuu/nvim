return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    keys = {
        {"<leader>bh", ":BufferLineCyclePrev<CR>", silent = true},
        {"<leader>b<Left>", ":BufferLineCyclePrev<CR>", silent = true},
        {"<leader>bl", ":BufferLineCycleNext<CR>", silent = true},
        {"<leader>b<Right>", ":BufferLineCycleNext<CR>", silent = true},
        {"<leader>bp", ":BufferLinePick<CR>", silent = true}, -- 选择一个buffer
        {"<leader>bd", ":bdelete<CR>", silent = true}, -- 关闭一个 buffer
    },
    lazy = false,
}

