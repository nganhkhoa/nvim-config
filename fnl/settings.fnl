(module user.plugin.settings
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util}})

;; buffergator
(set nvim.g.buffergator_display_regime "parentdir")

;; vaffle
(defn open-vaffle []
  (let [bufname (nvim.fn.bufname "%")]
    (if (= bufname "")
      (nvim.fn.vaffle#init)
      (nvim.fn.vaffle#init (nvim.fn.expand "%:p")))))

(nu.fn-bridge :OpenVaffle :user.plugin.settings :open-vaffle)
(nvim.set_keymap :n :<leader>dd ":call OpenVaffle()<CR>" {:noremap true :silent true})

;; vim-operator-surround
(nvim.set_keymap "" :sa "<Plug>(operator-surround-append)" {:silent true})
(nvim.set_keymap "" :sd "<Plug>(operator-surround-delete)" {:silent true})
(nvim.set_keymap "" :sr "<Plug>(operator-surround-replace)" {:silent true})

;; language-client neovim
;; (set nvim.g.LanguageClient_loggingFile "~/.config/nvim/lc.log")
(set nvim.g.LanguageClient_serverCommands
     {:c ["ccls"]
      :cpp ["ccls"]
      :objc ["ccls"]
      :objcpp ["ccls"]
      :go ["gopls"]
      :rust ["rls"]})

(nvim.command "set completefunc=LanguageClient#complete")
(nvim.set_keymap "" :gd "<Plug>(lcn-definition)" {:silent true})
(nvim.set_keymap "" :gh "<Plug>(lcn-hover)" {:silent true})
(nvim.set_keymap "" :gr "<Plug>(lcn-references)" {:silent true})
