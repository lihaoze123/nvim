require('nvim-treesitter.configs').setup({
    ensure_installed = { 'vim', 'bash', 'c', 'cpp', 'json', 'lua', 'rust', 'python' },
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
})
