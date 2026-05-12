require("bufferline").setup({
    options = {
        -- mouse actions
        close_command = "Bdelete! %d",       -- use vim-bbye so buffers closing doesn't break layout
        right_mouse_command = "Bdelete! %d", -- use vim-bbye so buffers closing doesn't break layout
        left_mouse_command = "buffer %d",    -- switch to clicked buffer
        middle_mouse_command = nil,
        -- buffer UI
        show_buffer_icons = true,
        indicator = {
            style = "icon",
            icon = "▎",
        },
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        show_buffer_close_icons = false,
        -- buffer_close_icon = "",
        separator_style = "slant",
        -- tab setup
        show_tab_indicators = true,
        -- show_close_icon = true, -- for tab close icon in list
        -- close_icon = "",
        -- buffer display setup
        numbers = "none",       -- don't include buffer ID / ordinal number
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        -- LSP etc diagnostics
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, _, _)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,                                                             -- include LSP diagnostics in each buffer display
        -- misc
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } }, -- if file tree is open, maintain position
        persist_buffer_sort = true,                                      -- whether or not custom sorted buffers should persist
        enforce_regular_tabs = false,                                    -- fixed size tabs. Needs to be false to get unique names showing for files with same name, different dir
        always_show_bufferline = true,
        sort_by = "id",                                                  -- order by buffer id (ie opened order)
        custom_filter = function(buf_number, _)
            if vim.bo[buf_number].filetype ~= "qf" then
                return true
            end
        end,
    },
})
