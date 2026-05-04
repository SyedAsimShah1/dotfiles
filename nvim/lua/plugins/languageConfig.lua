return {
	{ "mason-org/mason.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
	},
	-- Completion Config
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	-- LSP Config
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- LSPs
				"lua-language-server",
				-- Formatters
				"stylua",
				-- Linters
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- letting lazydev configure lua
			vim.lsp.enable("lua_ls")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", function()
						require("fzf-lua").lsp_definitions()
					end, "Goto Definition")

					map("gD", vim.lsp.buf.declaration, "Goto Declaration")

					map("gv", function()
						require("fzf-lua").lsp_definitions({
							jump1_action = FzfLua.actions.buf_vsplit,
							jump1 = true,
						})
					end, "[G]oto Definition [V]ertical Split")

					map("gr", function()
						require("fzf-lua").lsp_references()
					end, "References")

					map("gI", function()
						require("fzf-lua").lsp_implementations()
					end, "Implementation")

					map("<leader>D", function()
						require("fzf-lua").lsp_typedefs()
					end, "Type Definition")

					map("<leader>ds", function()
						require("fzf-lua").lsp_document_symbols()
					end, "Document Symbols")

					map("<leader>ws", function()
						require("fzf-lua").lsp_workspace_symbols()
					end, "Workspace Symbols")

					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("<C-k>", vim.lsp.buf.hover, "Hover Documentation")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- vim.api.nvim_create_autocmd("CursorHold", {
					-- 	buffer = event.buf,
					-- 	callback = function()
					-- 		local opts = {
					-- 			focusable = false,
					-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					-- 			border = "rounded",
					-- 			source = "always",
					-- 			prefix = " ",
					-- 			scope = "cursor",
					-- 		}
					-- 		vim.diagnostic.open_float(nil, opts)
					-- 	end,
					-- })
					-- The following autocommand is used to enable inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})
		end,
	},
	-- Formatter Config
	{
		"stevearc/conform.nvim",
		lazy = false,
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
	},
	-- Lint Config
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Map your linters here
			linters_by_ft = {},
		},
		config = function(_, opts)
			local lint = require("lint")
			lint.linters_by_ft = opts.linters_by_ft

			local timer = vim.uv.new_timer()

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					timer:stop()
					timer:start(
						250,
						0,
						vim.schedule_wrap(function()
							if vim.api.nvim_buf_is_valid(0) then
								lint.try_lint()
							end
						end)
					)
				end,
			})
		end,
	},
}
