-- Plugins
require("plugins")
-- Settings
require("settings")
-- Key mapping
require("map")
-- LSP setup
require("lsp-config")
-- Treesitter config
require("treeshitter-config")
-- Compe config
require("plugins.cmp")
-- Everybody wants that line
require("plugins.that-line")
-- Telescope
require("plugins.telepoop")
-- Neogit
require("plugins.neogit")
-- mini.bufremove
require("mini.bufremove").setup({})
-- treeshitter-context
require("plugins.treeshitter-context")
-- buffer manager
require("buffer_manager").setup({
	width = 120,
	height = 12,
	focus_alternate_buffer = true,
})
