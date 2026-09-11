return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"vimdoc",
			"vim",
			"query",
            "markdown",
            "markdown_inline",
            "c",
            "cpp",
		})
	end,
}
