require("nvim-treesitter.config").setup({
	highlight = { enable = true },
	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = { query = { "@function.outer", "@class.outer" } },
			},
			goto_previous_start = {
				["[f"] = { query = { "@function.outer", "@class.outer" } },
			},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["is"] = "@block.inner",
				["as"] = "@block.outer",
			},
		},
	},
})
