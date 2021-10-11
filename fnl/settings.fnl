(module user.plugin.settings
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util}})

;; theme
(global github-theme (require :github-theme))
(github-theme.setup {:theme_style :dark})

;; buffergator
(set nvim.g.buffergator_display_regime "parentdir")

;; nvim tree
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

;; kommentary
(global kommentary (require :kommentary.config))
(kommentary.configure_language :default {:prefer_single_line_comments true})
(kommentary.configure_language :objcpp {:prefer_single_line_comments true})

;; lualine
(global lualine (require :lualine))
(lualine.setup
  {:options {:theme :nightfly
             :section_separators ["" ""]
             :component_separators ["" ""]
             :icons_enabled true}
  :sections {:lualine_a {1 {1 :mode
                            :upper true}}
             :lualine_b {1 {1 :branch
                            :icon ""}}
             :lualine_c {1 {1 :filename
                            :file_status true}}
             :lualine_x ["encoding" "fileformat" "filetype"]
             :lualine_y ["progress"]
             :lualine_z ["location"]}
  :inactive_sections {:lualine_a {}
                      :lualine_b {}
                      :lualine_c ["filename"]
                      :lualine_x ["location"]
                      :lualine_y {}
                      :lualine_z {}}
  :extensions ["fugitive"]})
