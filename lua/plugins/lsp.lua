return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "-header-insertion=never"
          },
          init_options = {
            fallbackFlags = { 
              '--std=c++23' 
            }
          },
        },
      }
    }
  },
}
