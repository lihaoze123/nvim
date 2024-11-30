vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- normal mode --------------
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>q", "<C-w>q")

-- 高亮
keymap.set("n", "<leader>nh", ":noh<CR>")

-- 标签页
keymap.set("n", "H", ":tabprevious<CR>")
keymap.set("n", "L", ":tabnext<CR>")


-- ---------- 插件 --------------
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- nvim-lspconfig
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method('textDocument/rename') then
      -- Create a keymap for vim.lsp.buf.rename()
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    end
    if client.supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation
    end
  end,
})
