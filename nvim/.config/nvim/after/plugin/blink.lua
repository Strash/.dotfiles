local p = require("plugin_loader").load("blink.cmp")

if p ~= nil then
	p.setup({
		keymap = {
			["<CR>"] = { "accept", "select_and_accept", "fallback" },
			["<C-e>"] = { "show", "hide", "fallback" },
			["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-k>"] = { "scroll_documentation_up", "fallback" },
			["<C-j>"] = { "scroll_documentation_down", "fallback" },
		},
		completion = {
			keyword = {
				range = "full",
			},
			trigger = {
				show_on_x_blocked_trigger_characters = { "{", "}", ",", "(", ")" },
			},
			menu = {
				-- auto_show = false,
				auto_show = function(ctx)
					return ctx.mode ~= "cmdline" and not vim.tbl_contains(
						{ "/", "?" }, vim.fn.getcmdtype()
					)
				end,
				draw = {
					columns = { { "kind_icon" }, { "label" } },
					components = {
						kind_icon = {
							text = function(ctx)
								local icon, _, _ = MiniIcons.get("lsp", ctx.kind)
								return icon .. ctx.icon_gap
							end
						},
						label_description = {
							ellipsis = false,
							width = { max = 30 },
							text = function(ctx)
								if #ctx.label_description > 30 then
									---@type string
									local desc = ctx.label_description
									return desc:sub(0, 10) .. "…" .. desc:sub(#desc - 18, #desc)
								end
								return ctx.label_description
							end
						}
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				window = {
					min_width = 20,
					max_width = 80,
					max_height = 40,
				}
			},
		},
		signature = {
			enabled = true,
			trigger = {
				enabled = false,
				show_on_trigger_character = false,
				show_on_insert_on_trigger_character = false,
			},
		},
	})
end
