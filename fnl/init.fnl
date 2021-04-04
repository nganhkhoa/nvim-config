(module user.config
  {require {nvim aniseed.nvim}})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))


(set nvim.g.mapleader ",")
(set nvim.g.maplocalleader ",")

(noremap :i :jj :<esc>)
(noremap :n :j :gj)
(noremap :n :k :gk)

(set nvim.o.tabstop 2)
(set nvim.bo.tabstop 2)

(set nvim.o.shiftwidth 2)
(set nvim.bo.shiftwidth 2)

(set nvim.o.softtabstop 2)
(set nvim.bo.softtabstop 2)

(set nvim.o.expandtab true)
(set nvim.bo.expandtab true)

(set nvim.o.number true)
(set nvim.wo.number true)

(set nvim.o.relativenumber true)
(set nvim.wo.relativenumber true)

(require "settings")
