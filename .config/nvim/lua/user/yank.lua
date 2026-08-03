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
    maybe_file_line = vim.trim(vim.fn.getreg("+") or "")

    local file, line, col

    -- try file:line:col
    file, line, col = maybe_file_line:match("^(.-):(%d+):(%d+):?")

    -- try file:line
    if not file then
        file, line = maybe_file_line:match("^(.-):(%d+):?")
    end

    -- otherwise, just use input as file
    if not file then
        file = maybe_file_line
    end

    if vim.fn.filereadable(file) == 0 then
        vim.print("can't open " .. file)
        return false
    end

    vim.cmd.edit(file)

    if line then
        line_int = math.floor(tonumber(line) or 0)
        col_int = math.floor(tonumber(col) or 0)
        vim.api.nvim_win_set_cursor(0, {line_int, col_int})
    end

    vim.print("opened " .. maybe_file_line)
end

return M
