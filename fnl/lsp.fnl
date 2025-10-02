(module user.lsp
  {require {nvim aniseed.nvim}})

(import-macros {:autocmds autocmds} :aniseed.macros.autocmds)

(local treesitter (require :nvim-treesitter))

; (local cmp (require :cmp))
; (local cmp_ai (require :cmp_ai.config))

(nvim.set_keymap "" :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gh "<cmd>lua vim.lsp.buf.hover()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :<leader>e "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:silent true :noremap true})

(vim.lsp.config "rust_analyzer" {})
(vim.lsp.config "gopls" {})
; (vim.lsp.config "hls"
;                 {:cmd ["haskell-language-server-wrapper"
;                        "--lsp"
;                        "--logfile"
;                        "/home/r00t/.cache/nvim/hls.log"
;                        "--debug"]})
(vim.lsp.enable "racket_langserver")

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
   {:name :buffer}
   ; {:name :cmp_ai}
   ])

(local prompt_command
  (fn [lines_before lines_after]
    (.. "<|fim_prefix|>" lines_before "<|fim_suffix|>" lines_after "<|fim_middle|>")))

(local raw_fetch
  (fn [response]
    ; (nvim.notify (vim.api.inspect response))
    (set nvim.g.ai_raw_response response)))

; (cmp_ai:setup {:max_lines 5
;                :provider "Ollama"
;                :provider_options {:model "qwen2.5-coder:1.5b"
;                                   ; :auto_unload true
;                                   :prompt prompt_command
;                                   :raw_response_cb raw_fetch}
;                :notify true
;                ; :notify_callback (fn [msg] (nvim.notify msg))
;                :run_on_every_keystroke true
;                :log_errors true
;                :debug true
;                })

; (cmp.setup {:formatting
;             {:format (fn [entry item]
;                        (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
;                        item)}
;             :mapping {:<S-k> (cmp.mapping.select_prev_item)
;                       :<S-j> (cmp.mapping.select_next_item)
;                       ; :<C-b> (cmp.mapping.scroll_docs (- 4))
;                       ; :<C-f> (cmp.mapping.scroll_docs 4)
;                       ; :<C-Space> (cmp.mapping.complete)
;                       ; :<C-e> (cmp.mapping.close)
;                       :<C-x> (cmp.mapping.complete
;                                {:config {:sources (cmp.config.sources {:name "cmp_ai"})}}
;                                [ "i" ]
;                                )
;                       :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
;                                                   :select true})}
;             :sources cmp-srcs})
