-- treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

vim.pack.add({
    { src = "https://github.com/OXY2DEV/foldtext.nvim" }
})
