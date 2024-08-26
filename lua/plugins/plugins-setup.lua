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
	use {'neoclide/coc.nvim', branch = 'release'}
	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
	use 'numToStr/Comment.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'ggandor/leap.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
    use { 'xeluxee/competitest.nvim', requires = { 'MunifTanjim/nui.nvim' } }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use { "zbirenbaum/copilot.lua" }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
