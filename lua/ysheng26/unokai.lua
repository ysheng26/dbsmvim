-- Helper function to make the syntax cleaner
local function hi(group, options)
	vim.api.nvim_set_hl(0, group, options)
end

local function override()
	local cyan_fg = { fg = "#66d9ef", bold = false }
	local green_fg = { fg = "#a6e22e", bold = false }
	local red_fg = { fg = "#f92672", bold = false }
	local white_fg = { fg = "#f8f8f2", bold = false }
	local yellow_fg = { fg = "#e6db74", bold = false }

	-- Popup / Float Windows (K Hover)
	hi("NormalFloat", { bg = "#1e1e1e", fg = "#f8f8f2" })
	hi("FloatBorder", { fg = "#ffffff", bg = "#1e1e1e" })
	hi("FloatTitle", { fg = "#66d9ef", bg = "#1e1e1e", bold = false })

	-- Unokai Reverts: Types & Structures (Cyan & Flat)
	hi("Type", cyan_fg)
	hi("Structure", cyan_fg)
	hi("@type", cyan_fg) -- Modern Treesitter support

	-- Unokai Reverts: Functions (Green)
	hi("Function", green_fg)
	hi("@function", green_fg)

	-- Identifiers (White/Classic)
	hi("Identifier", white_fg)
	hi("@variable", white_fg)

	-- Keywords & Statements (Pink & Flat)
	hi("Keyword", red_fg)
	hi("Statement", red_fg)
	hi("PreProc", red_fg)
	hi("Define", red_fg)
	hi("@keyword", red_fg)

	-- HTML / JSX / TSX: Attributes (Green)
	hi("htmlArg", green_fg)
	hi("tsxAttrib", green_fg)
	hi("jsxAttrib", green_fg)
	hi("xmlAttrib", green_fg)
	hi("@tag.attribute", green_fg) -- Crucial for Treesitter

	-- HTML / JSX / TSX: Tags (Pink/Red)
	hi("Tag", red_fg)
	hi("htmlTagName", red_fg)
	hi("tsxTagName", red_fg)
	hi("jsxTagName", red_fg)
	hi("xmlTagName", red_fg)
	hi("@tag", red_fg) -- Crucial for Treesitter
	hi("@tag.builtin", red_fg)

	-- yaml
	hi("yamlBlockMappingKey", red_fg)
	hi("yamlPlainScalar", yellow_fg)

	-- treesitter context
	hi("TreesitterContext", { bg = "#1e1e1e", fg = "#f8f8f2" })
	hi("TreesitterContextBottom", { underline = true, sp = "Grey" })
	hi("TreesitterContextLineNumberBottom", { underline = true, sp = "Grey" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "unokai",
	callback = function()
		override()
	end,
})

override()
