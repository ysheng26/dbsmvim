-- Helper function to make the syntax cleaner
local function hi(group, options)
	vim.api.nvim_set_hl(0, group, options)
end

local function override()
	-- 1. Popup / Float Windows (K Hover)
	hi("NormalFloat", { bg = "#1e1e1e", fg = "#f8f8f2" })
	hi("FloatBorder", { fg = "#ffffff", bg = "#1e1e1e" })
	hi("FloatTitle", { fg = "#66d9ef", bg = "#1e1e1e", bold = false })

	-- 2. Unokai Reverts: Types & Structures (Cyan & Flat)
	hi("Type", { fg = "#66d9ef", bold = false })
	hi("Structure", { fg = "#66d9ef", bold = false })
	hi("@type", { fg = "#66d9ef", bold = false }) -- Modern Treesitter support

	-- 3. Unokai Reverts: Functions (Green)
	hi("Function", { fg = "#a6e22e" })
	hi("@function", { fg = "#a6e22e" })

	-- 4. Identifiers (White/Classic)
	hi("Identifier", { fg = "#f8f8f2" })
	hi("@variable", { fg = "#f8f8f2" })

	-- 5. Keywords & Statements (Pink & Flat)
	local pink_flat = { fg = "#f92672", bold = false }
	hi("Keyword", pink_flat)
	hi("Statement", pink_flat)
	hi("PreProc", pink_flat)
	hi("Define", pink_flat)
	hi("@keyword", pink_flat)

	-- 6. HTML / JSX / TSX: Attributes (Green)
	local attr_green = { fg = "#a6e22e", bold = false }
	hi("htmlArg", attr_green)
	hi("tsxAttrib", attr_green)
	hi("jsxAttrib", attr_green)
	hi("xmlAttrib", attr_green)
	hi("@tag.attribute", attr_green) -- Crucial for Treesitter

	-- 7. HTML / JSX / TSX: Tags (Pink/Red)
	local tag_pink = { fg = "#f92672", bold = false }
	hi("Tag", tag_pink)
	hi("htmlTagName", tag_pink)
	hi("tsxTagName", tag_pink)
	hi("jsxTagName", tag_pink)
	hi("xmlTagName", tag_pink)
	hi("@tag", tag_pink) -- Crucial for Treesitter
	hi("@tag.builtin", tag_pink)

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
