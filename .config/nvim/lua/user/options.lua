-- recommended for nvim-tree EARLY in init start up. options.lua is called first.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false                                              -- don't create a backup file
vim.opt.clipboard = "unnamedplus"                                   -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                                               -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" } -- mostly just for cmp
vim.opt.conceallevel = 0                                            -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                                      -- write everything in utf-8
vim.opt.hlsearch = true                                             -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                                           -- ignore case in search patterns
vim.opt.mouse = "a"                                                 -- allow the mouse to be used
vim.opt.pumheight = 10                                              -- pop up menu height
vim.opt.showmode = false                                            -- don't show `-- INSERT --` etc
vim.opt.showtabline = 2                                             -- always show tabs
vim.opt.smartcase = true                                            -- smart case for search. Do case sensitive search if caps are used in search term
vim.opt.smartindent = true                                          -- indent after { } etc syntax
vim.opt.splitbelow = true                                           -- when horiontal splitting, put new split below current one
vim.opt.splitright = true                                           -- when vertical splitting, put new split to the right of the current one
vim.opt.swapfile = false                                            -- don't create swapfile. Consider re-enabling for large files
vim.opt.termguicolors = true                                        -- set term gui colors. If false, colors in terminal will be used instead of desired colors of theme etc
vim.opt.timeoutlen = 300                                            -- wait for mapped sequence to complete (ms)
vim.opt.undofile = true                                             -- persistent undo
vim.opt.updatetime = 300                                            -- faster completion (4000ms default)
vim.api.nvim_set_option_value("updatetime", 300, { scope = "global" })
vim.opt.writebackup = false                                         -- don't make write backup as part of saving
vim.opt.expandtab = true                                            -- convert tabs to spaces
vim.opt.shiftwidth = 2                                              -- insert 2 spaces each indentation level
--vim.opt.tabstop = 2 -- insert 2 characters for each tab character entered
vim.opt.cursorline = false                                          -- highlight current cursor line
-- vim.opt.colorcolumn = "80,100,120"
vim.opt.number = true                                               -- show number lines
vim.opt.relativenumber = false                                      -- don't use relative number lines, just absolute
vim.opt.numberwidth = 4                                             -- show 4 chars in left margin for numbers
vim.opt.signcolumn =
"yes"                                                               -- always show sign column, so it doesn't make text bounce around
vim.opt.wrap = true                                                 -- show long lines as one long thing
vim.opt.scrolloff = 8                                               -- keep context at top/bottom when scrolling
vim.opt.sidescrolloff = 8                                           -- keep left/right context
vim.opt.guifont = "Hack Nerd Font Mono:h13"                         -- font to use when running in a GUI rather than CLI
vim.opt.shortmess:append("c")                                       -- don't show short messages for insert completions menu
vim.opt.whichwrap:append("<,>,[,],h,l")                             -- allow navigation keys to wrap at end of line etc
vim.opt.iskeyword:append("-")                                       -- match on words with a dash to allow vim motions over the dash
vim.opt.list = true                                                 -- enable tab/eol/trail etc chars
vim.opt.listchars:append({                                          -- chars to show if present
    tab = "▸ ",
    -- eol = '',
    trail = "✖",
})
vim.opt.startofline = false -- keep cursor position horizontally when moving up and down between lines
vim.opt.ruler = true        -- show ruler position
-- vim.opt.virtualedit = "all" -- allow moving cursor past end of line (useful when scrolling)
vim.g.have_nerd_font = true
vim.opt.breakindent = true
vim.opt.inccommand = 'split'
