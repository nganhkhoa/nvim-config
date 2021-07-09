(local packer (require :packer))

(packer.init {:git {:clone_timeout 120}})

(packer.startup (fn [use]
  (use :wbthomason/packer.nvim)
  (use :Olical/aniseed) ; fennel to lua

  ; themes
  (use :axvr/photon.vim)
  (use :projekt0n/github-nvim-theme)

  ; ui
  (use {1 :hoob3rt/lualine.nvim
        :requires {1 :kyazdani42/nvim-web-devicons :opt true}})
  (use :junegunn/goyo.vim)
  (use :Yggdroot/indentLine)
  (use :ntpeters/vim-better-whitespace)
  (use :valloric/matchtagalways)

  ; util
  (use :cocopon/vaffle.vim)
  (use :jeetsukumaran/vim-buffergator)
  (use :tpope/vim-fugitive)
  (use :kana/vim-operator-user)
  (use :rhysd/vim-operator-surround)
  (use :chaoren/vim-wordmotion)
  (use :b3nj5m1n/kommentary)
  (use :nelstrom/vim-visual-star-search)

  ; others
  (use :wakatime/vim-wakatime)
  (use :rescript-lang/vim-rescript)
  (use :otherjoel/vim-pollen)
  (use {1 :kkoomen/vim-doge :run ":call doge#install()"})))
