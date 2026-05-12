local ok, wk = pcall(require, "which-key") -- to register leader key labels for which key help
if not ok then
    vim.notify("couldn't load which-key")
    return
end

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- misc overrides
keymap("n", "z=", "<cmd>:Telescope spell_suggest<CR>", opts)

-- indent/unindent
keymap("n", "<Left>", "<<", opts)
keymap("n", "<Right>", ">>", opts)
keymap("v", "<Left>", "<gv", opts)
keymap("v", "<right>", ">gv", opts)

-- Move text up and down
keymap("n", "<Up>", ":m .-2<CR>", opts)
keymap("n", "<Down>", ":m .+1<CR>", opts)
keymap("v", "<Up>", ":m .-2<CR>", opts)
keymap("v", "<Down>", ":m .+1<CR>", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "<Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<Down>", ":move '>+1<CR>gv-gv", opts)

-- buffers
keymap("n", "<S-l>", "<cmd>lua require('user.buffer').safe_bnext()<CR>", opts)
keymap("n", "<S-h>", "<cmd>lua require('user.buffer').safe_bprev()<CR>", opts)
wk.add({
    { "<leader>b",  group = "Buffer" },
    { "<leader>bb", ":Bdelete<CR>",             desc = "Delete buffer" },
    { "<leader>bo", ":%bd|e#|bd#<CR>",          desc = "Close other buffers" },
    { "<leader>bt", ":BufferLineTogglePin<CR>", desc = "Pin buffer" },
})

-- searching
wk.add({
    { "<leader>f",   group = "Find" },
    { "<leader>f/",  ":nohlsearch<CR>",                                         desc = "Clear search highlights" },
    { "<leader>fa",  "<cmd>lua require('telescope.builtin').grep_string()<CR>", desc = "Search string under cursor" },
    { "<leader>fb",  "<cmd>lua require('telescope.builtin').buffers()<CR>",     desc = "Search buffers" },
    { "<leader>fd",  group = "dir-telescope" },
    { "<leader>fdf", "<cmd>Telescope dir find_files<CR>",                       desc = "Find files in dir by name" },
    { "<leader>fdg", "<cmd>Telescope dir live_grep<CR>",                        desc = "Search in dir" },
    { "<leader>ff",  "<cmd>lua require('telescope.builtin').find_files()<CR>",  desc = "Find files by name" },
    { "<leader>fg",  "<cmd>lua require('telescope.builtin').live_grep()<CR>",   desc = "Search" },
    { "<leader>fh",  ":Telescope harpoon marks<CR>",                            desc = "harpoon marks" },
    { "<leader>fj",  "<cmd>lua require('telescope.builtin').jumplist()<CR>",    desc = "Jumplist" },
    { "<leader>fr",  "<cmd>lua require('telescope.builtin').resume()<CR>",      desc = "Resume previous" },
    { "<leader>fs",  group = "spectre (search/replace)" },
    { "<leader>fsf", "<cmd>lua require('spectre').open_file_search()<CR>",      desc = "File search/replace" },
    { "<leader>fsg", "<cmd>lua require('spectre').open()<CR>",                  desc = "Global search/replace" },
    { "<leader>ft",  "<cmd>lua require('telescope.builtin').builtin()<CR>",     desc = "Telescope builtins" },
})

-- harpoon navigation
wk.add({
    { "<leader>h",  group = "Harpoon" },
    { "<leader>hD", "<cmd>lua require('harpoon.mark').clear_all()<CR>",                  desc = "clear all harpoon marks" },
    { "<leader>hd", "<cmd>lua require('harpoon.mark').rm_file()<CR>",                    desc = "remove harpoon mark" },
    { "<leader>hf", "<cmd>lua require('harpoon.mark').add_file()<CR>",                   desc = "add harpoon mark" },
    { "<leader>hh", "<cmd>lua require('harpoon.mark').toggle_file()<CR>",                desc = "toggle harpoon mark" },
    { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>",                     desc = "next harpoon" },
    { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>",                     desc = "prev harpoon" },
    { "<leader>hq", "<cmd>lua require('harpoon.mark').to_quickfix_list()<CR>:copen<CR>", desc = "open harpoon marks in quicklist" },
})

-- use beacon for search navigation in docs
wk.add({
    { "<leader><leader>", "<cmd>lua require('beacon').highlight_cursor()<CR>", desc = "highlight cursor" },
})

-- nvim tree
wk.add({
    { "<leader>d",  group = "Directory tree" },
    { "<leader>dd", ":NvimTreeToggle<CR>",   desc = "Toggle Tree" },
    { "<leader>df", ":NvimTreeFindFile<CR>", desc = "Focus on current file" },
})

-- diagnostics
wk.add({
    { "<leader>x",  group = "diagnostics" },
    { "<leader>xd", "<cmd>Trouble toggle diagnostics focus=true filter.buf=0<CR>",                                        desc = "Document diagnostics" },
    { "<leader>xf", "<cmd>lua vim.diagnostic.open_float({focus = true, focusable = true, height = 50, width = 120})<CR>", desc = "Open diagnostic float" },
    { "<leader>xn", function() vim.diagnostic.jump({ count = -1 }) end,                                                   desc = "Go to next diagnostic message" },
    { "<leader>xp", function() vim.diagnostic.jump({ count = 1 }) end,                                                    desc = "Go to previous diagnostic message" },
    { "<leader>xq", vim.diagnostic.setloclist,                                                                            desc = "Open diagnostic quickfix list" },
    { "<leader>xw", "<cmd>Trouble toggle diagnostics focus=true<CR>",                                                     desc = "Workspace diagnostics" }
})

-- git
wk.add({
    { "<leader>g",   group = "git" },
    { "<leader>g<",  "<cmd>:GitConflictChooseOurs<CR>",   desc = "conflict - choose OUR'S" },
    { "<leader>g>",  "<cmd>:GitConflictChooseTheirs<CR>", desc = "conflict - choose THEIR'S" },
    { "<leader>gb",  "<cmd>:Telescope git_bcommits<CR>",  desc = "buffer git commits" },
    { "<leader>gc",  "<cmd>:Telescope git_commits<CR>",   desc = "repo git commits" },
    { "<leader>go",  "<cmd>:GitBlameOpenCommitURL<CR>",   desc = "open commit in browser" },
    { "<leader>gp",  group = "Octo pr" },
    { "<leader>gpc", "<cmd>:Octo pr checkout<CR>",        desc = "Octo pr checkout" },
    { "<leader>gpd", "<cmd>:Octo pr diff<CR>",            desc = "Octo pr diff" },
    { "<leader>gph", "<cmd>:Octo pr changes<CR>",         desc = "Octo pr changes" },
    { "<leader>gpl", "<cmd>:Octo pr list<CR>",            desc = "Octo pr list" },
    { "<leader>gpm", "<cmd>:Octo pr commits<CR>",         desc = "Octo pr commits" },
    { "<leader>gt",  "<cmd>:GitBlameToggle<CR>",          desc = "toggle blame" },
    { "<leader>gx",  "<cmd>:GitConflictListQf<CR>",       desc = "conflict list" },
    { "<leader>gy",  "<cmd>:GitBlameCopySHA<CR>",         desc = "copy commit SHA to clipboard" },
}
)

-- other file
wk.add({
    { "<leader>o",  group = "other" },
    { "<leader>oo", "<cmd>:Other<CR>",      desc = "open other file" },
    { "<leader>ot", "<cmd>:Other test<CR>", desc = "open test file" },
})

-- LSP / code navigation
wk.add({
    { "gd",          "<cmd>lua vim.lsp.buf.definition()<CR>",                                                               desc = "go to LSP definition" },
    { "<leader>l",   group = "language server" },
    { "<leader>lD",  "<cmd>lua vim.lsp.buf.declaration()<CR>",                                                              desc = "Goto declaration" },
    { "<leader>lc",  group = "Codelens" },
    { "<leader>lcr", "<cmd>lua vim.lsp.codelens.run()<CR>",                                                                 desc = "Run codelens" },
    { "<leader>lct", "<cmd>lua require('user.lsp.codelens').toggle()<CR>",                                                  desc = "Toggle codelens" },
    { "<leader>ld",  "<cmd>lua vim.lsp.buf.definition()<CR>",                                                               desc = "Goto definition" },
    { "<leader>lh",  "<cmd>lua vim.lsp.buf.hover()<CR>",                                                                    desc = "Show hover info" },
    { "<leader>li",  "<cmd>lua vim.lsp.buf.implementation()<CR>",                                                           desc = "Goto implementation" },
    { "<leader>ll",  require("user.diagnostic").virtual_lines_toggle,                                                       desc = "Diagnostics toggle" },
    { "<leader>ln",  "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr = 0}), {bufnr = 0})<CR>", desc = "Inlay hint toggle" },
    { "<leader>lo",  "<cmd>Trouble toggle lsp_document_symbols win.position=right win.size.width=0.2 follow=false<CR>",     desc = "Outline toggle" },
    { "<leader>lri", "<cmd>Trouble toggle lsp_incoming_calls follow=false focus=true<CR>",                                  desc = "Incoming calls" },
    { "<leader>lro", "<cmd>Trouble toggle lsp_outgoing_calls follow=false focus=true<CR>",                                  desc = "Outgoing calls" },
    { "<leader>lrr", "<cmd>Trouble toggle lsp_references follow=false focus=true<CR>",                                      desc = "References" },
    { "<leader>ls",  "<cmd>lua vim.lsp.buf.signature_help()<CR>",                                                           desc = "Signature help" },
    { "<leader>lt",  "<cmd>lua vim.lsp.buf.type_definition()<CR>",                                                          desc = "Goto type definition" },
}
)

-- obsidian notes
wk.add({ { "<leader>n", group = "notes" },
    { "<leader>nn",  "<cmd>:ObsidianNew<CR>",         desc = "new note" },
    { "<leader>nt",  "<cmd>:ObsidianTags<CR>",        desc = "tags" },
    { "<leader>nq",  "<cmd>:ObsidianQuickSwitch<CR>", desc = "quick switch" },
    { "<leader>ns",  "<cmd>:ObsidianSearch<CR>",      desc = "search" },

    { "<leader>nl",  group = "notes links" },
    { "<leader>nll", "<cmd>:ObsidianLinks<CR>",       desc = "current buffer links" },
    { "<leader>nlb", "<cmd>:ObsidianBacklinks<CR>",   desc = "backlinks" },
    { "<leader>nle", "<cmd>:ObsidianExtractNote<CR>", desc = "extract selection to new note", mode = { "v" } },

    { "<leader>nd",  group = "daily notes" },
    { "<leader>ndd", "<cmd>:ObsidianToday<CR>",       desc = "today" },
    { "<leader>ndl", "<cmd>:ObsidianDailies<CR>",     desc = "list dailies" },

    -- ObsidianExtractNote

}
)
