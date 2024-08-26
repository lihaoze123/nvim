local opt = vim.opt

-- 行号
opt.relativenumber = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 窗口
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.signcolumn = "yes"
vim.cmd[[colorscheme dracula]]
