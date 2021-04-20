vim.g['aniseed#env'] = true

vim.g.polyglot_disabled = {"markdown", "javascript"}

require('plugins')

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
