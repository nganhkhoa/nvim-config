vim.g['aniseed#env'] = true

vim.g.polyglot_disabled = {"markdown", "javascript", "perl"}

vim.cmd([[
au! BufRead,BufNewFile,BufWritePost *.pm set filetype=pollen
au! BufRead,BufNewFile,BufWritePost *.pp set filetype=pollen
au! BufRead,BufNewFile,BufWritePost *.ptree set filetype=pollen

" Suggested editor settings:
" autocmd FileType pollen setlocal wrap      " Soft wrap (don't affect buffer)
" autocmd FileType pollen setlocal linebreak " Wrap on word-breaks only
]])

require('plugins')

kommentary = require('kommentary.config')

kommentary.configure_language("default", {
    prefer_single_line_comments = true,
})
kommentary.configure_language("objcpp", {
    prefer_single_line_comments = true,
})
