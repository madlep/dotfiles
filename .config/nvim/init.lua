vim.loader.enable()

require("user.options")

-- set colorscheme before plugins, because highlights can get messed up otherwise (bufferline separators etc)
require("user.colorscheme")

-- user/plugins.rb will load everything in user/plugin_config/*.lua
require("user.plugins")

-- migrate from packer -> vim.pack
require("user.packages")

-- regular setup
require("user.autocmds")
require("user.diagnostic")
require("user.filetype")
require("user.folding")
require("user.highlights")
require("user.keymaps")
require("user.commands")
