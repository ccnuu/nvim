# Plugins

## 懒加载插件

- event：在某个事件触发时候加载插件
- cmd：在某个命令被执行时加载插件
- ft：当前buffer为特定文件类型时加载插件
- keys：当触发快捷键时加载插件，如果快捷键不存在则创建快捷键

## 插件列表

- tokyonight 主题
- Bufferline 
- nvim-autopairs 自动补全符号(括号，花括号...)
- nvim-surround 自动补全符号（如选中某段字符串给它加上双引号）
- hop.nvim 精确跳转
- Mason 安装语言服务（管理工具）
    - mason-lspconfig
    - nvim-lspconfig

## Buffer / Window / Tab

- buffer: 文件在内存当中的表示
    - 使用 buffers 命令查看所有 buffer
    - 使用 buffer 命令切换到指定的 buffer
- window: 显示 buffer 的视窗，一个窗口同一时间存在一个 buffer
    - vsplit [文件名] 左右分屏
    - split [文件名] 上下分屏
    - <C-w>h 切换到左侧窗口
    - <C-w>l 切换到右侧窗口
    - <C-w>j 切换到下方窗口
    - <C-w>k 切换到上方窗口
    - <C-w>c 关闭窗口
    - <C-w>o 关闭其他窗口
- tab page: window 的集合，一个 nvim session 可以有多个 window
    - tabnew 新建一个 tab
    - tabprevious 上一个 tab
    - tabnext 下一个 tab
    - tabclose 关闭当前 tab

## hop

命令：`HopWord`

## Mason

命令：`Mason`

[nvim-lspconfig配置文档](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)

