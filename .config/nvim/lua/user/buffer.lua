local M = {}

M.safe_bnext = function()
    if vim.bo.buflisted then
        vim.cmd([[ :bnext ]])
    end
end

M.safe_bprev = function()
    if vim.bo.buflisted then
        vim.cmd([[ :bprev ]])
    end
end

return M
