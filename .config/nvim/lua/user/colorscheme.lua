vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
})
require('onedark').setup {
    style = 'deep',
    code_style = {
        functions = 'bold',
    }
}
require('onedark').load()
