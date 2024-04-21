(module user.plugin.settings
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util}})

(nvim.ex.autocmd "BufRead * DetectIndent")

;; theme
(nvim.command "silent! colorscheme aquarium")

;; buffergator
(set nvim.g.buffergator_display_regime "parentdir")

;; Vaffle
(defn open-vaffle []
  (let [bufname (nvim.fn.bufname "%")]
    (if (= bufname "")
      (nvim.fn.vaffle#init)
      (nvim.fn.vaffle#init (nvim.fn.expand "%:p")))))

(nu.fn-bridge :OpenVaffle :user.plugin.settings :open-vaffle)
(nvim.set_keymap :n :<leader>dd ":call OpenVaffle()<CR>" {:noremap true :silent true})

;; fzf

(nvim.set_keymap :n :<leader>ff ":lua require('fzf-lua').live_grep()<CR>" {:noremap true :silent true})


;; surround.nvim
(global surround (require :surround))
(surround.setup
  {:mappings_style "sandwich"
   })

;; kommentary
(global kommentary (require :kommentary.config))
(kommentary.configure_language :default {:prefer_single_line_comments true})
(kommentary.configure_language :objcpp {:prefer_single_line_comments true})

;; lualine
(global lualine (require :lualine))
(lualine.setup
  {:options {:theme :aquarium
             :section_separators ["" ""]
             :component_separators ["" ""]
             :icons_enabled true}
  :sections {:lualine_a {1 {1 :mode
                            :upper true}}
             :lualine_b {1 {1 :branch
                            :icon ""}}
             :lualine_c {1 {1 :filename
                            :file_status true}}
             :lualine_x ["%{&expandtab?shiftwidth().\"sp\":\"tabs\"}" "encoding" "fileformat" "filetype"]
             :lualine_y ["progress"]
             :lualine_z ["location"]}
  :inactive_sections {:lualine_a {}
                      :lualine_b {}
                      :lualine_c ["filename"]
                      :lualine_x ["location"]
                      :lualine_y {}
                      :lualine_z {}}
  :extensions ["fugitive"]})
