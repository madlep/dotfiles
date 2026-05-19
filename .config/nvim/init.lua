vim.loader.enable()

require("user.options")

-- migrate from packer -> vim.pack
require("user.packages")

-- colorscheme
require("user.colorscheme")


-- regular setup
require("user.autocmds")
require("user.diagnostic")
require("user.filetype")
require("user.folding")
require("user.highlights")
require("user.keymaps")
require("user.commands")
