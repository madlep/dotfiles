local lualine = require("lualine")

local show_in_width = function()
    return vim.fn.winwidth(0) > 100
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = show_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    colored = true,
    icons_enabled = true,
    icon = { align = "right" },
    cond = show_in_width,
}

local lsp_status = {
    "lsp_status",
    icon = "", -- f013
    symbols = {
        -- Standard unicode symbols to cycle through for LSP progress:
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        -- Standard unicode symbol for when LSP is done:
        done = "✓",
        -- Delimiter inserted between LSP names:
        separator = " ",
    },
    -- List of LSP names to ignore (e.g., `null-ls`):
    ignore_lsp = {},
    -- Display the LSP name
    show_name = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    colored = true,
    icon = "",
    cond = show_in_width,
}

local location = {
    "location",
    padding = 0,
    cond = show_in_width,
}

local filename = {
    "filename",
    draw_empty = true,
    colored = true,
    file_status = true,
    new_file_status = true,
    path = 1,
    symbols = {
        modified = "",
        readonly = "",
        unnamed = "",
        newfile = "",
    },
}

local full_filename = {
    "filename",
    draw_empty = true,
    colored = true,
    file_status = true,
    new_file_status = true,
    path = 3,
    shorting_target = 80,
    symbols = {},
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { filename },
        lualine_b = { lsp_status, filetype },
        lualine_c = { diagnostics },
        lualine_x = { diff, branch },
        lualine_y = { mode },
        lualine_z = { location, "progress" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { location, "progress" },
    },
    tabline = {},
    winbar = {
        lualine_a = { full_filename },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = { full_filename },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        "nvim-tree",
    },
})
