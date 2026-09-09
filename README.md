# nvim

Neovim config

## 基础配置

### nvim 常用快捷键

- w word
- e end
- b back
- y copy
- p paste
- u 撤回
- c 修改，常用: `cf<字符>` `ca<字符>` `ci<字符>` `ct<字符>`
- <num>f/F<字符> 跳转对应字符位置
- t/T <字符> 跳转到对应字符位置前一个字符

### Neovim 配置文件的位置

+ Unix: `~/.config/nvim/init.lua`
+ Windows: `~/AppData/Local/nvim/init.lua` （~ 一般是 C:/Users/[user]）

如果找不到，在 nvim 中输入命令 `:= vim.fn.stdpath("config")`

#### 配置目录说明

- nvim
    - `init.lua` 入口
    - `core` 核心配置
        - `basic.lua` 基础配置
        - `keymap.lua` 快捷键配置

### 核心配置

`vim.opt.xxx`

### 快捷键配置

`vim.keymap.set(mode, lhs, rhs, opts)`

例如：`vim.keymap.set("n", "<C-a>b", ":lua print('hello world')<CR>", "{silent = true}")`

> 如果想要在 normal模式和insert模式 下同时适配一个快捷键可以这样写：
> 
> `vim.keymap.set({"n", "i"}, "<C-a>b", "<Cmd>lua print('hello world')<CR>", {silent = true})`
> 
> `<Cmd>` 不是一个具体的按键，normal模式下，它是 `:`; insert模式下，它是 `<C-o>:`

## 插件

如果不使用插件管理器，就需要单独clone插件源码，并且应用进来自己的配置中
- 插件多了，管理繁琐
- 多台设备不方便共享配置

安装插件管理器 `lazy.nvim`
- 提前安装 `git` 和 [nerd font](https://www.nerdfonts.com/)
- 配置自动化安装 `lazy`
    ```lua
    local lazypath = vim.fn.stdpath("data") .. "/lazy.lazy.nvim"

    if not vim.uv.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    require("lazy").setup({})
    ```
- 使用 `lazy.nvim` 安装主题插件
    - 自动读取 `lua/plugins` 下的文件，用来对插件进行配置
    ```lua
    require(lazy).setup({
        spec = {
            {import = "plugins"},
        },
    })
    ```

### 插件配置

[详细插件配置信息](./lua/plugins/README.md)
