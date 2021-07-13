-- Both a bootstraper and stub to call fnl/init.lua

local fn = vim.fn
local execute = vim.api.nvim_command

if fn.empty(fn.glob(fn.stdpath('data')..'/site/pack/packer/start/')) > 0 then
  local github = 'https://github.com/'
  local packer_git = github..'wbthomason/packer.nvim'
  local aniseed_git = github..'Olical/aniseed'

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/'
  local packer_path = install_path..'packer.nvim'
  local aniseed_path = install_path..'aniseed'

  fn.system({'git', 'clone', packer_git, packer_path})
  fn.system({'git', 'clone', aniseed_git, aniseed_path})

  -- load packer (to install plugins) and aniseed (compile fennel to lua)
  execute 'packadd packer.nvim'
  execute 'packadd aniseed'
  -- load only plugins to install plugins
  require('aniseed.env').init({compile = true, module = 'plugins'})
  execute 'PackerUpdate'

  print('Plugins are installed, but config is not fully loaded, please open Neovim again')

else

-- call through aniseed
vim.g['aniseed#env'] = true

end
