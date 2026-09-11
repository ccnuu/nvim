return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
	},
	keys = {
		{ "<leader>lr", ":Lspsaga rename<CR>" }, -- 重命名
		{ "<leader>lc", ":Lspsaga code_action<CR>" }, -- 代码提示
		{ "<leader>ld", vim.lsp.buf.definition }, -- 跳转到定义/声明
		-- { "<leader>ld", ":Lspsaga goto_type_definition<CR>" }, -- 跳转到定义/声明
		{ "<leader>lh", ":Lspsaga hover_doc<CR>" }, -- 显示帮助文档
		{ "<leader>lR", ":Lspsaga finder<CR>" }, -- 寻找代码/代码的引用
		{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>" }, -- 跳转下一个警告
		{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>" }, -- 跳转到上一个警告
	},
}
