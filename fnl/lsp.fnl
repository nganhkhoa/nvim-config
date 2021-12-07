(module user.lsp
  {require {nvim aniseed.nvim}})

(global lspconfig (require :lspconfig))
(global treesitter (require :nvim-treesitter.configs))

(nvim.set_keymap "" :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gh "<cmd>lua vim.lsp.buf.hover()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:silent true :noremap true})
(nvim.set_keymap "" :<leader>e "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:silent true :noremap true})

(lspconfig.rust_analyzer.setup {})
(lspconfig.gopls.setup {})
(lspconfig.denols.setup {})
; (lspconfig.sourcekit.setup {})
; (lspconfig.ccls.setup
;   {:init_options {:clang {:extraArgs ["-I/usr/local/include"
;                                       "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1"
;                                       "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/12.0.0/include"
;                                       "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
;                                       "-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"
;                                       "-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks"]}}})

(treesitter.setup {:ensure_installed ["c" "cpp" "python" "go" "rust" "javascript" "lua"]
                   :highlight {:enable true}
                   :indent {:enable true}
                   :textobjects {:select {:enable true
                                          :keymaps {:ia "@parameter.inner"
                                                    :oa "@parameter.outer"}}
                                 :swap {:enable true
                                        :swap_next {:<S-l> "@parameter.inner"}
                                        :swap_previous {:<S-h> "@parameter.inner"}}}})

(set nvim.o.completeopt "menuone,noselect")
