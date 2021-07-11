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

(noremap :t :<esc> :<C-\><C-n>)
(noremap :t :jj :<esc>)

(nvim.set_keymap
  "n"
  "<leader>s"
  ":mksession!<CR>"
  {:noremap true :silent true})

(nvim.set_keymap
  "n"
  "[<Space>"
  ":call append(line('.') - 1, repeat([''], v:count1))<CR>"
  {:noremap true :silent true})

(nvim.set_keymap
  "n"
  "]<Space>"
  ":call append(line('.'), repeat([''], v:count1))<CR>"
  {:noremap true :silent true})

(set nvim.o.tabstop 2)
(set nvim.bo.tabstop 2)

(set nvim.o.shiftwidth 2)
(set nvim.bo.shiftwidth 2)

(set nvim.o.softtabstop 2)
(set nvim.bo.softtabstop 2)

(set nvim.o.expandtab true)
(set nvim.bo.expandtab true)

(set nvim.o.breakindent true)
(set nvim.wo.breakindent true)

(set nvim.o.linebreak true)
(set nvim.wo.linebreak true)

(set nvim.o.number true)
(set nvim.wo.number true)

(set nvim.o.relativenumber true)
(set nvim.wo.relativenumber true)

(set nvim.o.signcolumn "yes")
(set nvim.wo.signcolumn "yes")

(set nvim.o.termguicolors true)

(require "plugins")
(require "settings")
(require "lsp")
