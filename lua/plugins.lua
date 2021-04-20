local packer = require('packer')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Olical/aniseed'

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'nord',
          section_separators = {'', ''},
          component_separators = {'', ''},
          icons_enabled = true,
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
          lualine_c = { {'filename', file_status = true} },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location'  },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {   }
        },
        extensions = { 'fugitive' }
      }
    end
  }

  use 'Yggdroot/indentLine'
  use 'ntpeters/vim-better-whitespace'
  use 'valloric/matchtagalways'

  use 'cocopon/vaffle.vim'
  use 'jeetsukumaran/vim-buffergator'

  use 'tpope/vim-fugitive'

  use 'kana/vim-operator-user'
  use 'rhysd/vim-operator-surround'
  use 'chaoren/vim-wordmotion'
  use 'b3nj5m1n/kommentary'

  use 'nelstrom/vim-visual-star-search'

  use 'wakatime/vim-wakatime'

  use 'sheerun/vim-polyglot'
  use 'rescript-lang/vim-rescript'

  use {
    'autozimu/LanguageClient-neovim',
    branch = 'next',
    run = 'bash install.sh'
  }
end)
