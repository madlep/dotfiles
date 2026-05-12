-- useful lua functions used by everything
vim.pack.add { "https://github.com/nvim-lua/plenary.nvim" }

-- make buffer/window management less janky
vim.pack.add { "https://github.com/moll/vim-bbye" }

-- key binding helpers
vim.pack.add { "https://github.com/folke/which-key.nvim" }
require("which-key").setup({})

-- better quick fix
-- vim.pack.add { "https://github.com/kevinhwang91/nvim-bqf" }
vim.pack.add({ { src = "https://github.com/madlep/nvim-bqf", version = "native-treesitter-preview-fallback" } })
require("bqf").setup({})

-- add/delete surrounding ({[]}) etc
vim.pack.add { "https://github.com/machakann/vim-sandwich" }

-- code/test alternate file switching
vim.pack.add { "https://github.com/rgroli/other.nvim" }
require("user.package_config.other")

-- use <C-h><C-j> etc to move between tmux windows and neovim
vim.pack.add { "https://github.com/alexghergh/nvim-tmux-navigation" }
require("user.package_config.nvim-tmux-navigation")

-- nicer buffer list at top
vim.pack.add { "https://github.com/akinsho/bufferline.nvim" }
require("user.package_config.bufferline")

-- nicer line at bottom of the screen
vim.pack.add { "https://github.com/nvim-lualine/lualine.nvim" }
require("user.package_config.lualine")

-- show vertical tab markers for indentation level
vim.pack.add { "https://github.com/lukas-reineke/indent-blankline.nvim", "https://github.com/andersevenrud/nvim_context_vt" }
require("user.package_config.indent-blankline")
require("user.package_config.nvim_context_vt")

-- report workspace wide diagnostics/warnings/errors
vim.pack.add {
    "https://github.com/folke/trouble.nvim",
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
}
require("user.package_config.trouble")
require("lsp_lines").setup({})

-- telescope UI
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind

        if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
            vim.system(
                {
                    "make" },
                { cwd = ev.data.path })
        end
    end
})
vim.pack.add {
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/princejoogie/dir-telescope.nvim",
    "https://github.com/ThePrimeagen/harpoon"
}
require("user.package_config.telescope")
require("dir-telescope").setup({})
require("harpoon").setup({})

-- highlight word under cursor throughout doc
vim.pack.add { "https://github.com/rrethy/vim-illuminate" }
require("illuminate").configure({})

-- flash cursor line on movements
vim.pack.add { "https://github.com/DanilaMihailov/beacon.nvim" }
require("beacon").setup({})

-- show change status in left margin
vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }
require("gitsigns").setup({})

-- show gitblame
vim.pack.add { "https://github.com/f-person/git-blame.nvim" }
require("gitblame").setup({})

-- icons
vim.pack.add { "https://github.com/nvim-tree/nvim-web-devicons" }
require("nvim-web-devicons").setup({})

vim.pack.add { "https://github.com/nvim-mini/mini.icons" }
require("mini.icons").setup({})

-- directory tree
vim.pack.add { "https://github.com/nvim-tree/nvim-tree.lua" }
require("user.package_config.nvim-tree")

-- completion
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind

        if name == "blink.cmp" and (kind == "install" or kind == "update") then
            if not ev.data.active then
                vim.cmd.packadd("blink.cmp")
            end
            require('blink-cmp').build():wait(60000)
        end
    end
})
vim.pack.add {
    "https://github.com/saghen/blink.cmp",
    "https://github.com/saghen/blink.lib",
}
require("blink-cmp").setup({})

-- completion snippets
vim.pack.add { "https://github.com/rafamadriz/friendly-snippets" }

-- treesitter
vim.pack.add { "https://github.com/romus204/tree-sitter-manager.nvim" }
require("tree-sitter-manager").setup({})

-- lsp
vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/onsails/lspkind.nvim"
}
require("mason").setup({})
require("mason-lspconfig").setup()
require("lspkind").setup()
