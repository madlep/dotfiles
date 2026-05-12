vim.cmd([[
augroup filetypedetect
  au! BufRead,BufNewFile *.avsc setfiletype avsc
]])
