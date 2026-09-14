# Plugins

`lua/plugins` 下的每个 `.lua` 文件对应一个插件配置（lazy.nvim 的 spec）。
`lua/core/lazy.lua` 通过 `{ import = "plugins" }` 自动读取整个目录，新增插件只需新建文件，无需改动别处。

## 目录

```text
lua/plugins/
├── README.md            插件说明文档（本文件）
├── tokyonight.lua       folke/tokyonight.nvim                 配色主题
├── bufferline.lua       akinsho/bufferline.nvim               顶部 buffer 标签栏
├── lualine.lua          nvim-lualine/lualine.nvim             底部状态栏
├── indent-blank.lua     lukas-reineke/indent-blankline.nvim   缩进参考线
├── nvim-tree.lua        nvim-tree/nvim-tree.lua               文件树侧边栏
├── telescope.lua        nvim-telescope/telescope.nvim         模糊查找
├── grug-far.lua         MagicDuck/grug-far.nvim               项目级查找替换
├── hop.lua              smoka7/hop.nvim                       全文精确跳转
├── nvim-autopairs.lua   windwp/nvim-autopairs                 自动补全括号
├── nvim-surround.lua    kylechui/nvim-surround                成对符号增删改
├── tree-sitter.lua      nvim-treesitter/nvim-treesitter       语法解析与高亮
├── blink.lua            saghen/blink.cmp                      代码/命令行补全
├── mason.lua            williamboman/mason.nvim               LSP 安装管理
├── lspsaga.lua          nvimdev/lspsaga.nvim                  LSP 增强 UI
└── none-ls.lua          nvimtools/none-ls.nvim                格式化等非 LSP 工具
```

## 懒加载

插件不必在启动时全部加载，通过 spec 里的字段声明加载时机：

- `event`：某个事件触发时加载，如 `InsertEnter`、`VeryLazy`
- `cmd`：某个命令被执行时加载，如 `Telescope`、`Mason`
- `ft`：当前 buffer 为特定文件类型时加载
- `keys`：触发快捷键时加载；快捷键不存在时由 lazy 自动创建
- `lazy = false`：禁用懒加载，启动即加载（如 `bufferline`、`tree-sitter`）

## 插件说明

### tokyonight.nvim
配色主题，配置为 `moon` 风格，setup 后立即执行 `colorscheme tokyonight`。

### bufferline.nvim
把打开的 buffer 以标签栏形式显示在顶部，标题上带 LSP 诊断计数（error / warning / info）。
依赖 `nvim-web-devicons` 提供文件图标。禁用懒加载，启动即显示。

### lualine.nvim
底部状态栏。主题跟随配色方案（`auto`），启用了 `nvim-tree` 扩展。
左侧显示分支、diff、诊断；右侧显示文件大小、编码、文件类型。`VeryLazy` 时加载。

### indent-blankline.nvim
为每一层缩进画一条竖线，便于看清代码层级。入口模块为 `ibl`，`VeryLazy` 时加载。

### nvim-tree.lua
左侧文件树。`quit_on_open = true`，打开文件后自动收起树。依赖 `nvim-web-devicons`。

### telescope.nvim
模糊查找器，用于找文件、搜文本、跳符号等。命令 `Telescope` 首次调用时加载。
依赖 `plenary.nvim`；`telescope-fzf-native.nvim` 需要 cmake 编译，提供更快的模糊匹配。

### grug-far.nvim
在项目范围内做查找 + 替换，并预览每一处改动。命令 `GrugFar` 触发加载。

### hop.nvim
输入提示字符后直接跳到目标位置，比反复按 `f` / `/` 更精准。`hint_position = 3` 控制提示字符的显示位置。

### nvim-autopairs
输入左括号、左引号时自动补上右半边。首次进入插入模式（`InsertEnter`）时加载。

### nvim-surround
成对符号的增删改：例如给选中的字符串加上引号、把双引号改成单引号、删除外层括号。

### nvim-treesitter
基于 Tree-sitter 的语法解析，提供更准确的高亮、缩进与文本对象。
禁用懒加载，更新时执行 `:TSUpdate`。当前安装了 `lua`、`vimdoc`、`vim`、`query`、`markdown`、`markdown_inline`、`c`、`cpp` 语法。

### blink.cmp
补全引擎，同时负责代码补全和命令行补全（`:` 命令与 `/` 搜索）。
依赖 `friendly-snippets` 提供代码片段；使用 `super-tab` 预设，`<Tab>` 依次尝试接受片段、跳转片段位置、选中候选项。
补全来源：`path`、`snippets`、`buffer`、`lsp`。

### mason.nvim
外部工具（语言服务器、格式化器等）的安装管理器。命令 `Mason` 打开管理界面。
依赖 `nvim-lspconfig` 和 `mason-lspconfig`，负责把 mason 的包名映射成 lspconfig 的名字。
当前配置会安装 `lua-language-server`，并在 attach 时关闭 LSP 自带的格式化（格式化交给 none-ls）。

### lspsaga.nvim
LSP 增强 UI：重命名、代码操作、悬浮文档、查找引用、诊断跳转等。命令 `Lspsaga` 触发加载。

### none-ls.nvim
把非 LSP 的工具（格式化、lint、code action）接入 Neovim 的 LSP 接口。依赖 `plenary.nvim`。
当前通过 mason 安装 `stylua` 并只注册了 Lua 格式化。

## Buffer / Window / Tab

- buffer：文件在内存中的表示
    - `:buffers` 查看所有 buffer
    - `:buffer <n>` 切换到指定 buffer
- window：显示 buffer 的视窗，一个窗口同一时间显示一个 buffer
    - `:vsplit [文件名]` 左右分屏
    - `:split [文件名]` 上下分屏
    - `<C-w>h` 切换到左侧窗口
    - `<C-w>l` 切换到右侧窗口
    - `<C-w>j` 切换到下方窗口
    - `<C-w>k` 切换到上方窗口
    - `<C-w>c` 关闭窗口
    - `<C-w>o` 关闭其他窗口
- tab page：window 的集合，一个 nvim session 可以有多个 tab
    - `:tabnew` 新建一个 tab
    - `:tabprevious` 上一个 tab
    - `:tabnext` 下一个 tab
    - `:tabclose` 关闭当前 tab

## 快捷键速查

以 `<leader>`（空格）开头的自定义快捷键：

| 快捷键 | 作用 | 来自 |
| --- | --- | --- |
| `<leader>to` / `<leader>tc` | 打开 / 关闭文件树 | nvim-tree |
| `<leader>bh` / `<leader>b<Left>` | 上一个 buffer | bufferline |
| `<leader>bl` / `<leader>b<Right>` | 下一个 buffer | bufferline |
| `<leader>bp` | 选择 buffer | bufferline |
| `<leader>bd` | 关闭 buffer | bufferline |
| `<leader>hp` | `:HopWord` 精确跳转 | hop |
| `<leader>lr` | 重命名符号 | lspsaga |
| `<leader>lc` | 代码操作（code action） | lspsaga |
| `<leader>ld` | 跳转到定义（Neovim 内置 `vim.lsp.buf.definition`） | lspsaga |
| `<leader>lh` | 悬浮文档 | lspsaga |
| `<leader>lR` | 查找引用 / 定义 | lspsaga finder |
| `<leader>ln` / `<leader>lp` | 下一个 / 上一个诊断 | lspsaga |
| `<leader>lf` | 格式化当前文件 | none-ls |
| `<leader>gg` | 示例快捷键（打印 123） | core/keymap |

不经过 leader 的快捷键：

| 快捷键 | 作用 | 来自 |
| --- | --- | --- |
| `<C-h>` | `:Telescope live_grep` 全项目搜文本 | telescope |
| `<Tab>` | 接受 / 跳转补全项 | blink.cmp |

常用命令：

| 命令 | 作用 |
| --- | --- |
| `:Mason` | 打开语言服务 / 工具管理界面 |
| `:GrugFar` | 打开项目级查找替换 |
| `:Telescope` | 打开模糊查找器 |
| `:Lazy` | 打开插件管理界面（lazy.nvim） |

## 参考

- [nvim-lspconfig 支持的 LSP 列表](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
- [Mason 可安装的包](https://mason-registry.dev/registry/list)
