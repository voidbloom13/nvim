return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" }),
		})
	end,
}
