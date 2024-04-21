(local packer (require :packer))

(packer.init {:git {:clone_timeout 120}})

(packer.startup (fn [use]
  (use :wbthomason/packer.nvim)
  (use :Olical/aniseed) ; fennel to lua

  ; themes
  ; (use :projekt0n/github-nvim-theme)
  (use {
    1 :FrenzyExists/aquarium-vim
    :run ":silent! colorscheme aquarium"
  })

  ; ui
  (use :kyazdani42/nvim-web-devicons)
  (use :nvim-lualine/lualine.nvim)
  (use :lukas-reineke/indent-blankline.nvim)
  (use :ntpeters/vim-better-whitespace)
  ; (use :valloric/matchtagalways)

  ; util
  (use :cocopon/vaffle.vim)
  (use :jeetsukumaran/vim-buffergator)
  (use :tpope/vim-fugitive)
  (use :ur4ltz/surround.nvim)
  (use :b3nj5m1n/kommentary)
  (use :nelstrom/vim-visual-star-search)
  (use :timakro/vim-yadi)

  (use {
    1 :nvim-treesitter/nvim-treesitter
    :run (fn [] (let [ts (require :nvim-treesitter.install)]
      (ts.update {:with_sync true})))
  })
  (use {
    1 :nvim-treesitter/nvim-treesitter-textobjects
    :after "nvim-treesitter"
  })
  (use :neovim/nvim-lspconfig)

  ; completion
  (use :hrsh7th/nvim-cmp)
  (use :hrsh7th/cmp-nvim-lua)
  (use :hrsh7th/cmp-nvim-lsp)
  (use :hrsh7th/cmp-buffer)
  (use :hrsh7th/cmp-path)

  (use :ibhagwan/fzf-lua)

  ; others
  (use :wakatime/vim-wakatime)
  (use {1 :kkoomen/vim-doge :run ":call doge#install()"})))
