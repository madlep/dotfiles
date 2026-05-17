local packages = {
    -- useful lua functions used by everything
    "https://github.com/nvim-lua/plenary.nvim",

    -- make buffer/window management less janky
    "https://github.com/moll/vim-bbye",

    -- add/delete surrounding ({[]}) etc
    "https://github.com/machakann/vim-sandwich",

    -- theme
    "https://github.com/navarasu/onedark.nvim",

    -- tree sitter folding
    "https://github.com/OXY2DEV/foldtext.nvim",

    -- better quick fix
    {
        src = "https://github.com/madlep/nvim-bqf",
        version = "native-treesitter-preview-fallback",
        data = { setup = "bqf" }
    },

    -- key binding helpers
    {
        src = "https://github.com/folke/which-key.nvim",
        data = { setup = "which-key" }
    },

    -- code/test alternate file switching
    {
        src = "https://github.com/rgroli/other.nvim",
        data = { setup = "user.package_config.other" }
    },

    -- use <C-h><C-j> etc to move between tmux windows and neovim
    {
        src = "https://github.com/alexghergh/nvim-tmux-navigation",
        data = { setup = "user.package_config.nvim-tmux-navigation" }
    },

    -- nicer buffer list at top
    {
        src = "https://github.com/akinsho/bufferline.nvim",
        data = { setup = "user.package_config.bufferline" }
    },

    -- nicer line at bottom of the screen
    {
        src = "https://github.com/nvim-lualine/lualine.nvim",
        data = { setup = "user.package_config.lualine" }
    },

    -- show vertical tab markers for indentation level
    {
        src = "https://github.com/lukas-reineke/indent-blankline.nvim",
        data = { setup = "user.package_config.indent-blankline" }
    },

    -- show context at end of blocks
    {
        src = "https://github.com/andersevenrud/nvim_context_vt",
        data = { setup = "user.package_config.nvim_context_vt" }
    },

    -- diagnostics management
    {
        src = "https://github.com/folke/trouble.nvim",
        data = { setup = "user.package_config.trouble" }
    },

    -- show diagnostics inline
    {
        src = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        data = { setup = "lsp_lines" }
    },

    -- fuzzy finder binary used by telescope
    {
        src = "https://github.com/junegunn/fzf",
        data = { build = function(_) vim.fn["fzf#install"]() end }
    },

    -- telescope extension to use fzf
    {
        src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        data = {
            build = function(ev)
                vim.system({ "make" }, { cwd = ev.data.path, text = true }):wait(60000)
            end
        }
    },

    -- telescope finder UI
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        data = { setup = "user.package_config.telescope" }
    },

    -- scope telescope file finders to specfic directories
    {
        src = "https://github.com/princejoogie/dir-telescope.nvim",
        data = { setup = "dir-telescope" }
    },

    -- mark working files and jump between them quickly
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        data = { setup = "harpoon" }
    },

    -- highlight word under cursor throughout doc
    {
        src = "https://github.com/rrethy/vim-illuminate",
        data = { setup = "user.package_config.illuminate" }
    },

    -- flash cursor line on movements
    {
        src = "https://github.com/DanilaMihailov/beacon.nvim",
        data = { setup = "beacon" }
    },

    -- show git status in left margin
    {
        src = "https://github.com/lewis6991/gitsigns.nvim",
        data = { setup = "gitsigns" }
    },

    -- show gitblame as virtual text
    {
        src = "https://github.com/f-person/git-blame.nvim",
        data = { setup = "gitblame" }
    },

    -- icons
    {
        src = "https://github.com/nvim-tree/nvim-web-devicons",
        data = { setup = "nvim-web-devicons" }
    },

    -- more icons
    {
        src = "https://github.com/nvim-mini/mini.icons",
        data = { setup = "mini.icons" }
    },

    -- file navigation tree
    {
        src = "https://github.com/nvim-tree/nvim-tree.lua",
        data = { setup = "user.package_config.nvim-tree" }
    },

    -- completion library. used to install rust completion binary
    "https://github.com/saghen/blink.lib",

    -- completion
    {
        src = "https://github.com/saghen/blink.cmp",
        data = {
            build = function(_)
                require("blink.cmp").build():wait(60000)
            end,
            setup = "blink.cmp"
        }
    },

    -- snippets for completion
    "https://github.com/rafamadriz/friendly-snippets",

    -- manage and install treesitter parsers
    {
        src = "https://github.com/romus204/tree-sitter-manager.nvim",
        data = { setup = "tree-sitter-manager" }
    },

    -- configure LSP servers
    "https://github.com/neovim/nvim-lspconfig",

    -- install LSP servers
    {
        src = "https://github.com/mason-org/mason.nvim",
        data = { setup = "mason" }
    },

    -- connect installed servers
    {
        src = "https://github.com/mason-org/mason-lspconfig.nvim",
        data = { setup = "mason-lspconfig" }
    },

    -- pretty icons for LSP UIs
    {
        src = "https://github.com/onsails/lspkind.nvim",
        data = { setup = "lspkind" }
    },
}

local function package_name(spec)
    spec = type(spec) == 'string' and { src = spec } or spec
    local name = spec.name or spec.src:gsub('%.git$', '')
    return (type(name) == 'string' and name or ''):match('[^/]+$') or ''
end

-- vim.pack.del(vim.iter(vim.pack.get()):map(function(x) return x.spec.name end):totable(), {force = true})

-- #1 set up build hooks
local package_builds = {}
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        for _, package in ipairs(packages) do
            local name = package_name(package)
            if ev.data.spec.name == name and (ev.data.kind == "install" or ev.data.kind == "update") then
                if type(package) == "table" and type(package.data) == "table" and type(package.data.build) == "function" then
                    table.insert(package_builds, { fn = package.data.build, ev = ev, name = name })
                end
            end
        end
    end
})

-- #2 add packages
vim.pack.add(packages)

for _, package_build in ipairs(package_builds) do
    if not package_build.ev.data.active then
        vim.cmd.packadd(package_build.name)
    end
    package_build.fn(package_build.ev)
end

-- #3 setup
for _, package in ipairs(packages) do
    if type(package) == "table" and type(package.data) == "table" and package.data.setup ~= nil then
        local setup_type = type(package.data.setup)
        if setup_type == "string" then
            require(package.data.setup).setup({})
        end
    end
end
