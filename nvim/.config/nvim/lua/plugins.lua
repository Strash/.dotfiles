local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plug_autogroup = vim.api.nvim_create_augroup("StrPackGroup", {
	clear = true
})

vim.api.nvim_create_autocmd({
	"BufWritePost",
}, {
	pattern = "*/plugins.lua",
	command = "Lazy sync",
	group = plug_autogroup
})

return require("lazy").setup({
	-- COLORS
	-- zenbones
	{
		"mcchrish/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
	},
	-- kanagawa
	{ "rebelot/kanagawa.nvim" },
	-- mellifluous
	{ "ramojus/mellifluous.nvim" },
	-- tokyonight
	{ "folke/tokyonight.nvim" },
	{
		"cdmill/neomodern.nvim",
		config = function()
			require("neomodern").setup()
		end,
	},

	-- CORE
	-- lsp config
	{ "neovim/nvim-lspconfig" },
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdateSync",
	},

	-- PLUGINS
	-- cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
		},
	},
	-- neogit
	{
		"NeogitOrg/neogit",
		dependencies = "nvim-lua/plenary.nvim",
	},
	-- buffer manager
	{
		"j-morano/buffer_manager.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	-- oil
	{ "stevearc/oil.nvim" },
	-- fzf lua
	{ "ibhagwan/fzf-lua" },
	-- barbecue
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {}
	},
	-- indent blanklines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}, {
	defaults = {
		lazy = false,
	},
	dev = {
		path = "~/FOSS",
	},
	checker = {
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	readme = {
		enabled = false,
	},
})
