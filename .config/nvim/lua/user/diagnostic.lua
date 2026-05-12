vim.diagnostic.config({
    virtual_text = false, -- disabled, as lsp_lines handles display
    virtual_lines = true,
    source = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = ""
        },
    },
})

vim.opt.signcolumn = "yes"

local M = {}

local diag_state = "virtual_lines"

vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function(_)
        if diag_state ~= "virtual_lines" then
            vim.diagnostic.open_float(nil, { focusable = false })
        end
    end
})

local function on_virtual_text()
    vim.diagnostic.config({
        virtual_lines = false,
        virtual_text = true,
    })
end

local function on_virtual_lines()
    vim.diagnostic.config({
        virtual_lines = true,
        virtual_text = false,
    })
end

local function on_disabled()
    vim.diagnostic.config({
        virtual_lines = false,
        virtual_text = false,
    })
end

-- virtual_lines -> virtual_text -> disabled -> ...
local diag_states = {
    ["virtual_lines"] = { next_state = "virtual_text", f = on_virtual_lines },
    ["virtual_text"] = { next_state = "disabled", f = on_virtual_text },
    ["disabled"] = { next_state = "virtual_lines", f = on_disabled },
}

local function init_state(state)
    assert(diag_states[state], "unexpected state:" .. state).f()
end

M.virtual_lines_toggle = function()
    local new_state = assert(diag_states[diag_state], "unexpected diag_state:" .. diag_state).next_state
    init_state(new_state)
    diag_state = new_state
end

return M
