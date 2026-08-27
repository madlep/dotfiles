local M = {}

local xml_preview = function(text)
    local result = vim.system({ 'xmllint', '--format', '-' }, { stdin = text, text = true }):wait()
    if result.code ~= 0 then
        vim.notify('xmllint: ' .. result.stderr, vim.log.levels.ERROR)
        return
    end

    vim.cmd('tabnew')
    local buf = vim.api.nvim_get_current_buf()
    vim.bo[buf].buftype = 'nofile'   -- not backed by a file
    vim.bo[buf].bufhidden = 'wipe'   -- discard on close, nothing to save
    vim.bo[buf].swapfile = false
    vim.bo[buf].filetype = 'xml'
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(result.stdout, '\n'))
end

M.xml_preview_buffer = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    xml_preview(table.concat(lines, '\n'))
end

M.xml_preview_selection = function()
    vim.cmd('normal! gv"xy')
    xml_preview(vim.fn.getreg('x'))
end

vim.api.nvim_create_user_command('XmlPreview', M.xml_preview_buffer, {})
vim.api.nvim_create_user_command('XmlPreviewSelection', M.xml_preview_selection, { range = true })

return M
