local config = {
    "folke/tokyonight.nvim",
    opts = {
        style = "moon"
    },

    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
    end
}

return config
