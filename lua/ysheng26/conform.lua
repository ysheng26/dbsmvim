require("conform").setup({
	formatters_by_ft = {
		lua = { lsp_format = "prefer" },

		-- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },

		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { lsp_format = "prefer" },

		go = { "gofmt", "goimports", lsp_format = "fallback" },

		-- Conform will run the first available formatter
		-- javascript = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettier", stop_after_first = true },
		typescript = { "prettier", stop_after_first = true },
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- vim.keymap.set({ "n", "v" }, "<leader>f", require("conform").format, { desc = "Format", remap = false })
vim.keymap.set("", "<leader>f", function()
	require("conform").format({ async = true }, function(err)
		if not err then
			local mode = vim.api.nvim_get_mode().mode
			if vim.startswith(string.lower(mode), "v") then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
			end
		end
	end)
end, { desc = "Format code" })
