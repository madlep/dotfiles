require("nvim-tree").setup({
    hijack_cursor = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    prefer_startup_root = true,
    renderer = {
        root_folder_modifier = ":~",
        full_name = true,
        highlight_opened_files = "all",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        adaptive_size = false,
        width = {
            min = 40,
            max = 200,
        },
        side = "left",
        cursorline = true,
    },
})
