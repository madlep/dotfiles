local M = {}

M.yank_file_line = function()
    file = vim.fn.expand("%:.")
    line = vim.fn.line(".")
    file_line = file .. ":" .. line
    vim.fn.setreg("+", file_line)
    vim.print("yanked file:line " .. file_line)
end

M.yank_file = function()
    file = vim.fn.expand("%:.")
    vim.fn.setreg("+", file)
    vim.print("yanked file " .. file)
end

M.yank_absolute_file_line = function()
    file = vim.api.nvim_buf_get_name(0)
    line = vim.fn.line(".")
    file_line = file .. ":" .. line
    vim.fn.setreg("+", file_line)
    vim.print("yanked file:line " .. file_line)
end

M.yank_absolute_file = function()
    file = vim.api.nvim_buf_get_name(0)
    vim.fn.setreg("+", file)
    vim.print("yanked file " .. file)
end

M.open = function()
    maybe_file_line = vim.fn.getreg("+")
    file, line = maybe_file_line:match("^(.-):(%d+)$")
    if file then
        vim.print(file)
        local bufnr = vim.fn.bufadd(file)
        vim.fn.bufload(bufnr)
        vim.api.nvim_set_current_buf(bufnr)
        if line then
            line_int = math.floor(tonumber(line) or 0)
            vim.api.nvim_win_set_cursor(0, {line_int, 0})
        end
        vim.print("opened " .. maybe_file_line)
    else
        vim.print("don't know how to open " .. maybe_file_line)
    end
end

return M
