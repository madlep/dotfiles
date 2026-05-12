-- auto format on save
vim.cmd([[ autocmd BufWritePre *.ex,*.exs,*.rb,*.lua,*.rs,*.go,*.html.heex lua vim.lsp.buf.format()]])

-- force using eslint as ts-ls uses wrong formatting sometimes
vim.cmd([[ autocmd BufWritePre *.ts lua vim.lsp.buf.format({name = "eslint"})]])
--
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
