local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'p00f/nvim-ts-rainbow'
	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
	use 'numToStr/Comment.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'ggandor/leap.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
    use { 'xeluxee/competitest.nvim', requires = { 'MunifTanjim/nui.nvim' } }
    use ({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, })

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'windwp/nvim-autopairs'

    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use {'SirVer/ultisnips',
    requires = {{'honza/vim-snippets', rtp = '.'}},
    config = function()      
      vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
      vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
      vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
      vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end
}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
