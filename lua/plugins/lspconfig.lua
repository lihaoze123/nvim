require('lspconfig').clangd.setup {
    cmd = {
        "clangd",
        "-header-insertion=never"
    },
    init_options = {
        fallbackFlags = { 
	    '--std=c++23' 
	}
    },
}
