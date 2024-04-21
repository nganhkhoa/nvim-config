-- Both a bootstraper and stub to call fnl/init.lua

local fn = vim.fn
local execute = vim.api.nvim_command

bootstrap = fn.empty(fn.glob(fn.stdpath('data')..'/site/pack/packer/start/')) > 0
if bootstrap then
  local github = 'https://github.com/'
  local packer_git = github..'wbthomason/packer.nvim'
  local aniseed_git = github..'Olical/aniseed'

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/'
  local packer_path = install_path..'packer.nvim'
  local aniseed_path = install_path..'aniseed'

  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
      vim.cmd(":qa!")
    end,
  })

  fn.system({'git', 'clone', packer_git, packer_path})
  fn.system({'git', 'clone', aniseed_git, aniseed_path})

  -- load packer (to install plugins) and aniseed (compile fennel to lua)
  execute 'packadd packer.nvim'
  execute 'packadd aniseed'
  -- load only plugins to install plugins
  require('aniseed.env').init({compile = true, module = 'plugins'})
  execute 'PackerUpdate'
else
vim.g['aniseed#env'] = true
end
