return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = "VeryLazy",
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		keymap = {
			preset = "super-tab",
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					end
					if cmp.snippet_active({ direction = 1 }) then
						if not pcall(vim.snippet.jump, 1) then
							pcall(vim.snippet.stop)
						end
						return true
					end
					return cmp.select_and_accept()
				end,
				"fallback",
			},
		},
		sources = {
			default = { "path", "snippets", "buffer", "lsp" },
		},
		-- 命令行提示
		cmdline = {
			sources = function()
				local cmd_type = vim.fn.getcmdtype()
				if cmd_type == "/" then
					return { "buffer" }
				end
				if cmd_type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
			keymap = {
				preset = "super-tab",
			},
			completion = {
				menu = { auto_show = true },
			},
		},
	},
}
