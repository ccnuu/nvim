return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig",
    },

    config = function(_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")
        -- mason lsp 和 nvim lsp 之间的名字互转
        local mason_lsp_mappings = require("mason-lspconfig").get_mappings().package_to_lspconfig

        -- 安装插件
        -- lsp_name: lsp mason 插件中的名字，会自动映射成 nvim-lspconfig 中的名字
        -- config: lsp 的配置信息
        local function setup(lsp_name, config)
            -- install language server
            local success, package = pcall(registry.get_package, lsp_name)
            if success and not package:is_installed() then
                package:install()
            end

            -- setup lsp config
            local name = mason_lsp_mappings[lsp_name]
            vim.lsp.config(name, config)
            vim.lsp.enable(name)
        end

        -- lua lsp setup
        setup("lua-language-server", {
            capabilities = {
                textDocument = {
                    completion = {dynamicRegistration = false}
                },
            },
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"}
                    }
                }
            }
        })
        -- 管理诊断信息/错误提示外观等
        vim.diagnostic.config({
            underline = true,
            virtual_text = true,
            -- virtual_lines = true,
            update_in_insert = true,
        })
    end
}

