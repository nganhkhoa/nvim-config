git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/Olical/aniseed ~/.local/share/nvim/site/pack/packer/start/aniseed

mv ~/.local/share/nvim/site/pack/packer/start/aniseed/lua/aniseed/env.lua ./
cp aniseed_env.lua ~/.local/share/nvim/site/pack/packer/start/aniseed/lua/aniseed/env.lua

nvim -u bootstrap.lua

mv env.lua ~/.local/share/nvim/site/pack/packer/start/aniseed/lua/aniseed/env.lua
