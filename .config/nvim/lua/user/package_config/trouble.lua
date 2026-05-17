return {
    setup = function(_)
        require("trouble").setup({
            auto_open = false,
            warn_no_results = false,
            open_no_results = true,
            max_items = 2000,
            indent_guides = false,
        })
    end
}
