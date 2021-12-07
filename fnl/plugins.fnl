(local packer (require :packer))

(packer.init {:git {:clone_timeout 120}})

(packer.startup (fn [use]
  (use :wbthomason/packer.nvim)
  (use :Olical/aniseed) ; fennel to lua

  ; themes
  (use :projekt0n/github-nvim-theme)

  ; ui
  (use :kyazdani42/nvim-web-devicons)
  (use :nvim-lualine/lualine.nvim)
  (use :junegunn/goyo.vim)
  (use :lukas-reineke/indent-blankline.nvim)
  (use :ntpeters/vim-better-whitespace)
  (use :valloric/matchtagalways)

  ; util
  (use :cocopon/vaffle.vim)
  (use :jeetsukumaran/vim-buffergator)
  (use :tpope/vim-fugitive)
  (use :blackCauldron7/surround.nvim)
  (use :chaoren/vim-wordmotion)
  (use :b3nj5m1n/kommentary)
  (use :nelstrom/vim-visual-star-search)

  (use {1 :nvim-treesitter/nvim-treesitter :run ":TSUpdate"})
  (use :nvim-treesitter/nvim-treesitter-textobjects)
  (use :hrsh7th/nvim-compe)
  (use :neovim/nvim-lspconfig)

  ; others
  (use :wakatime/vim-wakatime)
  (use {1 :kkoomen/vim-doge :run ":call doge#install()"})))
