vim.api.nvim_create_user_command('Faster', function()
    vim.cmd([[
        GitBlameDisable
        TSContextDisable
        ]])
    require('ibl').update({ enabled = false })
end, { desc = 'disable slow plugins and config for large files' })
