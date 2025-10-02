(module user.lsp
  {require {nvim aniseed.nvim}})

(local lspconfig (require :lspconfig))
(local cmp (require :cmp))
(import-macros {:autocmds autocmds} :aniseed.macros.autocmds)

(local treesitter (require :nvim-treesitter))

(nvim.set_keymap "" :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gh "<cmd>lua vim.lsp.buf.hover()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :<leader>e "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:silent true :noremap true})

(lspconfig.rust_analyzer.setup {})
(lspconfig.gopls.setup {})
(lspconfig.hls.setup {
                      :cmd ["haskell-language-server-wrapper" "--lsp" "--logfile" "/home/r00t/.cache/nvim/hls.log" "--debug"]
                      })

; treesitter
(local treesitter_languages ["c" "cpp" "python" "go" "rust" "javascript" "typescript" "lua" "fennel" "haskell" "racket"])
(treesitter.install treesitter_languages)

(autocmds
  ["FileType"
   {:pattern treesitter_languages
    :callback (fn [event] (vim.treesitter.start))}
  ])

;; completion
(set nvim.o.completeopt "menu,menuone,noselect")

(def- cmp-src-menu-items
  {:buffer "buffer"
   :nvim_lsp "lsp"
   :path "path"})

(def- cmp-srcs
  [{:name :nvim_lsp}
   {:name :path}
   {:name :buffer}])

(cmp.setup {:formatting
            {:format (fn [entry item]
                       (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
                       item)}
            :mapping {:<S-k> (cmp.mapping.select_prev_item)
                      :<S-j> (cmp.mapping.select_next_item)
                      ; :<C-b> (cmp.mapping.scroll_docs (- 4))
                      ; :<C-f> (cmp.mapping.scroll_docs 4)
                      ; :<C-Space> (cmp.mapping.complete)
                      ; :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                  :select true})}
            :sources cmp-srcs})
