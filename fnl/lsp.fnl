(module user.lsp
  {require {nvim aniseed.nvim}})

(global lspconfig (require :lspconfig))
(global treesitter (require :nvim-treesitter.configs))

(nvim.set_keymap "" :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gh "<cmd>lua vim.lsp.buf.hover()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:silent true :noremap true})

(lspconfig.rust_analyzer.setup {})
(lspconfig.gopls.setup {})
(lspconfig.denols.setup {})

(treesitter.setup {:ensure_installed ["c" "cpp" "python" "go" "rust" "javascript" "lua"]
                   :highlight {:enable true}
                   :indent {:enable true}})

(set nvim.o.completeopt "menuone,noselect")
