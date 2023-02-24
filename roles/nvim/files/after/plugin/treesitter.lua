local ts = require("nvim-treesitter.configs")

ts.setup {
    ensure_installed = {
        'lua',
        'php',
    },

    highlight = {
        enable = true,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<cr>', -- set to `false` to disable one of the mappings
            node_incremental = '<cr>',
            scope_incremental = '<tab>',
            node_decremental = '<s-tab>',
        },
    },

    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
}
