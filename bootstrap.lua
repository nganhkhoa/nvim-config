local execute = vim.api.nvim_command

execute 'packadd packer.nvim'
execute 'packadd aniseed'
require('aniseed.env').init({compile = true})
execute 'PackerUpdate'
