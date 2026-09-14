# nvim

个人 Neovim 配置，使用 [`lazy.nvim`](https://github.com/folke/lazy.nvim) 管理插件。

## 目录结构

```text
nvim/
├── init.lua              # 入口，按顺序加载 core 下的三个模块
├── lazy-lock.json        # 插件版本锁（lazy.nvim 自动生成，一般不要手改）
├── lua/
│   ├── core/             # 与插件无关的核心配置
│   │   ├── basic.lua     # vim.opt.* 选项：行号、缩进、分屏、搜索、剪贴板
│   │   ├── keymap.lua    # vim.keymap.set 快捷键：leader、保存、撤销、删行
│   │   └── lazy.lua      # 引导安装 lazy.nvim，并导入 lua/plugins
│   └── plugins/          # 插件配置，一个文件一个插件
│       ├── README.md     # 插件说明、懒加载策略与快捷键速查
│       └── *.lua
└── test/                 # 手写练习 / 验证配置用的样例文件
```

启动流程：`init.lua` → `core.basic`（选项）→ `core.keymap`（快捷键）→ `core.lazy`（插件管理器接管 `lua/plugins`）。

## 基础配置

### nvim 常用快捷键

- w word
- e end
- b back
- y copy
- p paste
- u 撤回
- c 修改，常用: `cf<字符>` `ca<字符>` `ci<字符>` `ct<字符>`
- `<num>f/F<字符>` 跳转对应字符位置
- `t/T <字符>` 跳转到对应字符位置前一个字符

### 常用命令/参数

- `nvim --clean [文件]`：不使用配置打开 nvim
- 查看谁配置了某个属性：`verbose set shiftwidth`

### Neovim 配置文件的位置

- Unix: `~/.config/nvim/init.lua`
- Windows: `~/AppData/Local/nvim/init.lua`（`~` 一般是 `C:/Users/[user]`）

如果找不到，在 nvim 中输入 `:= vim.fn.stdpath("config")` 查看。

### 核心配置

在 `lua/core/basic.lua` 中用 `vim.opt.xxx` 设置，例如：

```lua
vim.opt.number = true          -- 显示行号
vim.opt.relativenumber = true  -- 相对行号
vim.opt.expandtab = true       -- Tab 转空格
vim.opt.tabstop = 4            -- Tab 宽度 4
vim.opt.splitbelow = true      -- 水平分屏开在下方
vim.opt.splitright = true      -- 垂直分屏开在右侧
vim.opt.ignorecase = true      -- 搜索忽略大小写
vim.opt.smartcase = true       -- 含大写字母时区分大小写
vim.opt.clipboard = "unnamedplus" -- 与系统剪贴板共用
```

### 快捷键配置

在 `lua/core/keymap.lua` 中用 `vim.keymap.set(mode, lhs, rhs, opts)` 设置：

```lua
vim.keymap.set("n", "<C-a>b", ":lua print('hello world')<CR>", { silent = true })
```

> 如果想在 normal 和 insert 模式下同时适配一个快捷键可以这样写：
>
> `vim.keymap.set({"n", "i"}, "<C-a>b", "<Cmd>lua print('hello world')<CR>", { silent = true })`
>
> `<Cmd>` 不是一个具体的按键：normal 模式下它是 `:`；insert 模式下它是 `<C-o>:`。

当前自定义快捷键：

| 快捷键 | 模式 | 作用 |
| --- | --- | --- |
| `<C-z>` | n / i | 撤销 |
| `<C-s>` | n / i | 保存 |
| `<C-x>` | n / i | 删除当前行 |
| `<A-o>` / `<A-O>` | n / i | 在下方 / 上方新开一行并进入插入模式 |

`leader` 为空格，`localleader` 为 `,`。

## 插件

不使用插件管理器时，需要单独 clone 插件源码并接进自己的配置：
- 插件多了，管理繁琐
- 多台设备不方便共享配置

所以这里使用 `lazy.nvim`：

- 提前安装 `git` 和 [nerd font](https://www.nerdfonts.com/)（图标依赖）
- `lua/core/lazy.lua` 会在首次启动时自动 clone `lazy.nvim`
- 通过 `{ import = "plugins" }` 自动读取 `lua/plugins` 下的所有文件，一个文件即一个插件配置

```lua
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})
```

插件的完整清单、简介、懒加载策略与快捷键见 [lua/plugins/README.md](./lua/plugins/README.md)。

### 插件速览

| 插件 | 作用 |
| --- | --- |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | 配色主题 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 文件树侧边栏 |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 顶部 buffer 标签栏 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 底部状态栏 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | 缩进参考线 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 模糊查找（文件、文本、符号等） |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | 项目级查找替换 |
| [hop.nvim](https://github.com/smoka7/hop.nvim) | 全文精确跳转 |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 输入左括号时自动补右括号 |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 成对符号（引号、括号、标签）的增删改 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 语法解析、高亮与缩进 |
| [blink.cmp](https://github.com/saghen/blink.cmp) | 代码/命令行补全 |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP 等外部工具的安装管理 |
| [lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim) | LSP 增强 UI（重命名、诊断、查找等） |
| [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim) | 通过 LSP 接口接入格式化等非 LSP 工具 |
