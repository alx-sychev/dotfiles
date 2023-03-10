-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "l",  action = "edit" },
                { key = "h",  action = "close_node" },
                { key = "c",  action = "copy_name" },
                { key = "C",  action = "copy_path" },
                { key = "ac", action = "copy_absolute_path" },
                { key = "y",  action = "copy" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
