local actions = require "telescope.actions"

require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            },
        },
    },
    defaults = {
        -- file_ignore_patterns = { "%mock_test_.go", "%mocks_temp.go" },
        mappings = {
            i = {
                -- Also close on Esc in insert mode
                ["<esc>"] = actions.close,
                ["<c-j>"] = actions.move_selection_next,
                ["<c-k>"] = actions.move_selection_previous,
                ["<c-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                ["<c-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<space>"] = actions.toggle_selection,
            }
        },
    },
}
require("telescope").load_extension("ui-select")


local builtin = require("telescope.builtin")
vim.keymap.set("n", "<c-p>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>a", builtin.grep_string, { desc = "Telescope grep string" })
vim.keymap.set("n", "g/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>m", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "gh", builtin.help_tags, { desc = "Telescope helptags" })
