return {
    setup = function(_)
        require("nvim_context_vt").setup({
            prefix = " ",
            disable_virtual_lines_ft = { "yaml" },
        })
    end
}

-- local config = require('nvim_context_vt.config')
-- table.insert(config.targets, "anonymous_function")
-- table.insert(config.targets, "binary_operator")
-- table.insert(config.targets, "do_block")
