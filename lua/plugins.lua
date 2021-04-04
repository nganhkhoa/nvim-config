local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Olical/aniseed'

  use 'Yggdroot/indentLine'
  use 'ntpeters/vim-better-whitespace'
  use 'valloric/matchtagalways'

  use 'cocopon/vaffle.vim'
  use 'jeetsukumaran/vim-buffergator'

  use 'tpope/vim-fugitive'

  use 'kana/vim-operator-user'
  use 'rhysd/vim-operator-surround'
  use 'chaoren/vim-wordmotion'

  use 'nelstrom/vim-visual-star-search'

  use 'wakatime/vim-wakatime'

  use 'sheerun/vim-polyglot'
end)
